class Roster < ActiveRecord::Base
  belongs_to :course
  has_many :evals, through: :course
  has_many :students, dependent: :destroy
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
end
