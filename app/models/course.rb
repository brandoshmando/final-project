class Course < ActiveRecord::Base
  has_many :rosters
  has_many :students, :through => :rosters
  belongs_to :professor
  has_and_belongs_to_many :assistants, join_table: 'assistants_courses'
  has_and_belongs_to_many :evals
end
