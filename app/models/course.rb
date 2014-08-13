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
      score_counter += grade.final_score
    end
    score_counter / self.students.count
  end


  def eval_grades(eval)
    eval_grades = Grades.where("eval_id = ?", eval.id)
    desc_scores = []
    eval_grades.each do |grade|
      desc_scores << grade.final_score.to_f
    end
    desc_scores.sort! {|x,y| y <=> x }
  end
end
