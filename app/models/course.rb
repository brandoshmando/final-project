class Course < ActiveRecord::Base
  has_many :rosters
  has_many :students, :through => :rosters
  has_many :grades, :through => :students
  belongs_to :professor
  has_and_belongs_to_many :assistants, join_table: 'assistants_courses'
  has_and_belongs_to_many :evals

  def average_score
    score_counter = 0
    self.grades.each do |grade|
      score_counter += grade.final_score.to_f
    end
    (score_counter / self.students.count) / 100
  end
#Method returns an array of scores for every student in said course
  def scores
    scores = self.students.map do |student|
      if student.total_score.nil?
        0
      else
        student.total_score.to_f / 100
      end
    end
    scores.sort
  end
#Method returns total possible points within a course
  def possible_points
    (self.evals.reduce(0) {|sum, eval| sum += eval.max_score.to_i; sum}.to_f) /100
  end
end
