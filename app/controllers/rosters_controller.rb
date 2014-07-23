class RostersController < ApplicationController
  before_action :load_course, only: [:new, :create]
  def new
    @roster = @course.rosters.build
  end

  def create
    @roster = @course.rosters.build(roster_params)

    if @roster.save
      redirect_to @roster, notice: "Roster added!"
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
      rediriect_to @roster, notice: "Changes to #{@roster.name} were saved!"
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

      private
  def roster_params
    params.require(:roster).permit(:section_name, :meet_time, :location, :meet_day, :course_id)
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
