class GradesController < ApplicationController
  before_action :load_eval
  def new
    @student = Student.find(params[:student_id])
    @grade = @student.grades.build
  end

  def create
    @grades = @student.grades.build(grades_params)

    if @grades.save
      redirect_to roster_path(@student.roster), notice: "#{@eval.title} successfully graded for #{@student.first_name} #{@student.last_name}"
    else
      render :new
    end
  end

  private
  def load_eval
    @eval = Eval.find(params[:eval_id])
  end
end
