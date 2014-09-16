class Student < ActiveRecord::Base
  require 'csv'
  has_many :grades
  has_and_belongs_to_many :rosters




  def self.import(params, roster)
    CSV.foreach(params["file"].path, headers: true) do |row|
      student_hash = row.to_hash
      student = Student.where(uid: student_hash["uid"])

      if student.count == 1
        student.first.update_attributes(student_hash)
        student.first.rosters << roster
      else
        new_student = Student.new(student_hash)
        new_student.roster_id = roster.id
        new_student.save
      end
    end
  end
#Method to total score of all grades for a student
  def total_all_grades
    self.update(
      total_score: (self.grades.reduce(0) {|sum, grade| sum += grade.final_score.to_f; sum}).to_s
    )
  end
# Creates shortcut to a course that a student is in
  def course(roster_id)
    self.rosters.find(roster_id).course
  end
# Creates shortcut to a evals that belong to a course that a student is in
  def evals(roster_id)
    self.rosters.find(roster_id).evals
  end
end
