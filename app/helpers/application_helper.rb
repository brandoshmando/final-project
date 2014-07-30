module ApplicationHelper
  def first_last(object)
    "#{object.first_name} #{object.last_name}"
  end

  def format_score(string)
    string.to_f/100
  end
end
