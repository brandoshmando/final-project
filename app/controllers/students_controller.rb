class StudentsController < ApplicationController
  before_action :load_parent_roster
  def import
    Student.import(params[:file])
    redirect_to @roster
  end

  def destroy
  end

    private
  def students_params
    params.require(:student).permit(:file, :roster_id)
  end

  def load_parent_roster
    @roster = Roster.find(params[:roster_id])
  end
end
