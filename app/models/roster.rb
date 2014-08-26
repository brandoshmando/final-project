class Roster < ActiveRecord::Base
  belongs_to :course
  has_many :evals, through: :course
  has_many :students, dependent: :destroy
  has_many :grades, through: :students
  accepts_nested_attributes_for :students
  before_save :set_status

  def as_csv
    students = Student.where('roster_id = ?', id)
    excluded_names = ['id', 'created_at', 'updated_at', 'roster_id']
    column_names = (Student.column_names - excluded_names)
    self.evals.order(title: :asc).each {|eval| column_names << eval.title }
    CSV.generate do |csv|
      csv << column_names
      students.each do |student|
        attributes = student.attributes.values_at(*(Student.column_names - excluded_names))
        student.grades.order(title: :asc).each {|grade| attributes << (grade.final_score.nil? ? "NA" : grade.final_score.to_f/100)}
        csv << attributes
      end
    end
  end
# Determines the average score for a particular section of a class
  def average_score
    score_counter = 0
    self.grades.each do |grade|
      score_counter += grade.final_score.to_f
    end
    unless score_counter == 0
      (score_counter / self.students.count).to_s
    end
  end
#Determines the average score on a particular eval
  def average_eval_score(eval)
    grades = self.grades.where("eval_id = ?", eval.id)
    if grades.empty?
      "No grades for this eval yet"
    else
      (grades.reduce(0) {|sum, grade| sum += grade.final_score.to_i; sum} / grades.count).to_f / 100
    end
  end
#Returns an array of grades on a particular eval for each student within a roster
  def eval_grades(eval)
    eval_grades = Grades.where("eval_id = ?", eval.id)
    desc_scores = []
    eval_grades.each do |grade|
      desc_scores << grade.final_score.to_f
    end
    desc_scores.sort! {|x,y| y <=> x }
  end
#Returns a collection of a roster's scores and sorts them from lowest to highest
  def roster_descending_scores
    roster_scores_array = []
    self.students.each do |student|
      roster_scores_array << (student.total_score.to_f / 100)
    end
    roster_scores_array.sort! {|x,y| y <=> x }
  end
#Determines a max score that this particlar section is out of
  def roster_max_score
    self.evals.reduce(0) {|sum, eval| sum + eval.max_score.to_f; sum }
  end
#Sets the current status of a roster to upcoming, active, or complete
  def set_status
    date = Time.now
    status = if self.start_date <= date && self.end_date >= date
      "active"
    elsif self.start_date > date
      "upcoming"
    elsif self.end_date < date
      "complete"
    end
    self.status = status
  end
end
