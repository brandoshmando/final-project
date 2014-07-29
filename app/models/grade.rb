class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  has_many :scores
  accepts_nested_attributes_for :scores
  before_save :total

  def total
    self.final_score = scores.reduce(0) { |sum, obj| sum += obj.score; sum }
  end
end
