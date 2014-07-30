class Score < ActiveRecord::Base
  belongs_to :category
  belongs_to :grade
  has_one :student, through: :grade
  has_and_belongs_to_many :comments
  before_save :db_score_format

  def db_score_format
    self.score = (self.score.to_f * 100).to_s
  end
end
