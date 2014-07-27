class Grade < ActiveRecord::Base
  belongs_to :student
  has_many :scores
  has_and_belongs_to_many :comments
  accepts_nested_attributes_for :scores
end
