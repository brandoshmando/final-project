module RostersHelper
  def days_of_week
    return [["Monday", "Monday"],["Tuesday", "Tuesday"], ["Wednesday", "Wednesday"], ["Thursday", "Tuesday"], ["Friday", "Friday"]]
  end

  def time_slots
   return (1..24).to_a
  end


end
