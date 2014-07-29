class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  has_many :scores
  accepts_nested_attributes_for :scores

  def total
    self.final_score = self.scores.inject(0) { |sum, obj| sum + obj.score; sum }
    self.save
  end

  # def comments
  #   self.scores.each do |score|
  #     score
  # end
end
