class Eval < ActiveRecord::Base
  has_many :categories
  has_many :comments, :through => :categories
  belongs_to :professor
  has_and_belongs_to_many :courses
  accepts_nested_attributes_for :categories, :allow_destroy => true
  before_save :total

  def total
    self.max_score = (self.categories.reduce(0) {|sum, category| sum += (category.max_score.to_f / 100); sum }.to_i * 100).to_s
  end
end
