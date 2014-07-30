class Roster < ActiveRecord::Base
  belongs_to :course
  has_many :evals, through: :course
  has_many :students, dependent: :destroy
  has_many :grades, through: :students
  accepts_nested_attributes_for :students

  def as_csv
    students = Student.where('roster_id = ?', id)
    excluded_names = ['id', 'created_at', 'updated_at', 'roster_id']
    column_names = (Student.column_names - excluded_names)
    self.evals.order(title: :asc).each {|eval| column_names << eval.title }
    CSV.generate do |csv|
      csv << column_names
      students.each do |student|
        attributes = student.attributes.values_at(*(Student.column_names - excluded_names))
        student.grades.order(title: :asc).each {|grade| attributes << (grade.final_score.nil? ? "NA" : grade.final_score) }
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
    (score_counter / self.students.count).to_s
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
end
