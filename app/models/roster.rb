class Roster < ActiveRecord::Base
  belongs_to :course
  has_many :evals, through: :course
  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :students

  def as_csv
    students = Student.where('roster_id = ?', id)
    excluded_names = ['id', 'created_at', 'updated_at', 'roster_id']
    CSV.generate do |csv|
      csv << (Student.column_names - excluded_names)
      students.each do |student|
        csv << student.attributes.values_at(*(Student.column_names - excluded_names))
      end
    end
  end
end
