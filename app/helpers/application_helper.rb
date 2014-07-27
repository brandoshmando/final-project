module ApplicationHelper
  def student_first_last(student)
    "#{student.first_name} #{student.last_name}"
  end
end
