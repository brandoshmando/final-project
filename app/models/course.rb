class Course < ActiveRecord::Base
  has_many :assistants
  has_many :rosters
  has_many :students, :through => :rosters
  belongs_to :professor
  has_and_belongs_to_many :evals
end
