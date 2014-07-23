class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "#{@course.name} was created!"
    else
      flash.now[:alert] = "Your course was not saved..."
      render :new
    end
  end
  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course, notice: "Change to #{@course.name} were successfully saved!"
    else
      flash.now[:alert] = "Changes to #{@course.name} were not saved..."
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
  end

    private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
