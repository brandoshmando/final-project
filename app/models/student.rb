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
      else
        Student.create!(student_hash)
      end
    end
  end
end
