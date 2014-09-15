class RostersController < ApplicationController
  before_action :load_course, only: [:new, :create]

  def index
    case params[:selected]
    when "active"
      @rosters = current_user.active_rosters
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @roster = @course.rosters.build
    student = @roster.students.build
  end

  def create
    @roster = @course.rosters.build(roster_params.except(:start_date, :end_date, :students_attributes))

    @roster.start_date = Time.strptime(params[:roster][:start_date], "%m/%d/%Y")
    @roster.end_date = Time.strptime(params[:roster][:end_date], "%m/%d/%Y")

    if @roster.save
      Student.import(roster_params[:students_attributes]["0"], @roster)
      redirect_to course_path(@roster.course.id)
    else
      flash.now[:alert] = "Your roster was not saved..."
      render :new
    end
  end

  def show
    @roster = Roster.find(params[:id])
  end

  def edit
    @roster = Roster.find(params[:id])
  end

  def update
    @roster = Roster.find(params[:id])

    if @roster.update(roster_params)
      redirect_to @roster, notice: "Changes to #{@roster.section_name} were saved!"
    else
      flash.now[:alert] = "Your changes were not saved..."
      render :edit
    end
  end

  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy
    # rediriect_to root_path
  end

  def export
    @roster = Roster.find(params[:id])
    send_data @roster.as_csv, type: "text/csv", filename: "#{@roster.section_name}.csv"
  end

      private
  def roster_params
    params.require(:roster).permit(:section_name, :meet_time, :location, :meet_day, :course_id, students_attributes: [:file])
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
