class StudentsController < ApplicationController
  def destroy
  end

    private
  def students_params
    params.require(:student).permit(:file, :roster_id)
  end
end
