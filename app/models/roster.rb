class Roster < ActiveRecord::Base
  belongs_to :course
  has_many :students
  accepts_nested_attributes_for :students
end
