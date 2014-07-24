class Student < ActiveRecord::Base
  require 'csv'
  has_many :grades
  belongs_to :roster

  def self.import(params, roster)


    CSV.foreach(params["file"].path, headers: true) do |row|
      student_hash = row.to_hash
      student = Student.where(uid: student_hash["uid"])

      if student.count == 1
        student.first.update_attributes(student_hash)
        student.first.update_attributes(roster_id: roster.id)
      else
        new_student = Student.new(student_hash)
        new_student.roster_id = roster.id
        new_student.save
      end
    end
  end
end
