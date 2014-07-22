class Eval < ActiveRecord::Base
  has_many :categories
  has_many :comments, :through => :categories
  has_many :grades
  belongs_to :professor
end
