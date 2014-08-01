class Category < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :grades
  belongs_to :eval, touch: true
  accepts_nested_attributes_for :comments, :allow_destroy => true
  before_save :db_score_format

  def db_score_format
    self.max_score = (self.max_score.to_f * 100).to_s
  end
end
