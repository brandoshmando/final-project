class GradesController < ApplicationController
  before_action :load_eval, only:[:new]
  before_action :load_student
  def new
    @grade = Grade.new
    (@eval.categories.count).times { @grade.scores.build}
  end

  def create
    @grade = Grade.new(grades_params)
    @grade.student_id = @student.id

    if @grade.save
      @grade.total
      redirect_to roster_path(@student.roster), notice: "#{@grade.title} successfully graded for #{@student.first_name} #{@student.last_name}!"
    else
      render :new
    end
  end

  private
  def grades_params
    params.require(:grade).permit(:title, :eval_id, scores_attributes: [:id, :score, :_delete])
  end

  def load_eval
    @eval = Eval.find(params[:eval_id])
  end

  def load_student
    @student = Student.find(params[:student_id])
  end
end
