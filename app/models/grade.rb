class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  has_many :scores
  accepts_nested_attributes_for :scores
  before_create :total, :max
  after_save :update_student_total_score

#Method that totals all of a grades scores which determines a grade's final score
  def total
    self.final_score = (self.scores.reduce(0) { |sum, obj| sum += obj.score.to_f; sum } * 100).to_s
  end
#Method that formats a grades maximum score to be manipulated into a float with proper rounding later
  def max
    self.max_score = (self.max_score.to_f * 100).to_s
  end
#Method that updates a students total score everytime a grade is saved
  def update_student_total_score
    self.student.total_all_grades
  end

  def eval
    Eval.find(self.eval_id)
  end

end
