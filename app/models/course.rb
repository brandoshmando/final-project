class Course < ActiveRecord::Base
  has_many :rosters
  has_many :students, :through => :rosters
  has_many :grades, :through => :students
  belongs_to :professor
  has_and_belongs_to_many :assistants, join_table: 'assistants_courses'
  has_and_belongs_to_many :evals

  def average_score
    score_counter = 0
    self.grades.each do |grades|
      score_counter += grade.final_score
    end
    score_counter / self.students.count
  end
end
