class Eval < ActiveRecord::Base
  has_many :categories
  has_many :comments, :through => :categories
  belongs_to :professor
  has_and_belongs_to_many :courses
end