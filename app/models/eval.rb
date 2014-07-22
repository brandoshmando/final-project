class Eval < ActiveRecord::Base
  has_many :categories
  has_many :comments, :through => :categories
  belongs_to :professor
end
