class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  has_many :scores
  accepts_nested_attributes_for :scores
  before_save :total, :db_score_format

  def total
    self.final_score = (self.scores.reduce(0) { |sum, obj| sum += obj.score.to_f; sum } * 100).to_s
  end

  def db_score_format
    self.max_score = (self.max_score.to_f * 100).to_s
  end
end
