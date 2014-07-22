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
    end
  end
  def show
    @course = Course.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def course_params
    params.require(:course).permit(:name, :description)
  end

end
