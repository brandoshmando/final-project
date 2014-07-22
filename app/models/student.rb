class Student < ActiveRecord::Base
  has_many :grades
  belongs_to :roster
end
