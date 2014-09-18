class Roster < ActiveRecord::Base
  belongs_to :course
  has_one :professor, through: :course
  has_many :evals, through: :course
  has_and_belongs_to_many :students
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
        student.grades.order(title: :asc).each {|grade| attributes << (grade.final_score.nil? ? "NA" : grade.final_score.to_f/100)}
        csv << attributes
      end
    end
  end
# Determines the average score for a particular section of a class
  def average_score
    score_total = self.grades.reduce(0) {|sum, grade| sum += grade.final_score.to_f; sum}

    unless score_total == 0
      (score_total / self.students.count) / 100
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
#Determines the percent of the course is complete for that
#particular section based on the number of grade objects
#for a course and the total number possible

  def percent_complete
    #Total the possible grade objects
    possible_grades = self.evals.count * self.students.count
    #Divide number of grades currently by possible_grades to get percentage
    # Times one hundred to format for jQuery Knob
    if self.grades.count == 0
      0
    else
      ((self.grades.count.to_f / possible_grades) * 100).to_i
    end
  end
end