class StudentsController < ApplicationController
  before_action :load_parent_roster

  def export(roster)
    @students = Student.where("roster_id = ?", roster.id)
  end

  def destroy
  end

    private
  def students_params
    params.require(:student).permit(:file, :roster_id)
  end

  # def load_parent_roster
  #   @roster = Roster.find(params[:roster_id])
  # end
end
