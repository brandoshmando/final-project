module ApplicationHelper
  def student_first_last(student)
    "#{student.first_name} #{student.last_name}"
  end

  def format_score(string)
    string.to_f/100
  end
end
