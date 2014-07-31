module RostersHelper
  def days_of_week
    return [["Monday", "Monday"],["Tuesday", "Tuesday"], ["Wednesday", "Wednesday"], ["Thursday", "Tuesday"], ["Friday", "Friday"]]
  end

  def time_slots
   return (1..24).to_a
  end

  def link_or_grade(student, eval_id)
    container = student.grades.where("eval_id = ?", eval_id)
    if container[0]
      format_score(container[0].final_score)
    else
      link_to "Grade", new_student_grade_path(student, eval_id: eval_id)
    end
  end

end
