class Grade < ActiveRecord::Base
  belongs_to :student
  has_many :scores
  accepts_nested_attributes_for :scores
end
