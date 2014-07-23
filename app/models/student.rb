class Student < ActiveRecord::Base
  require 'csv'
  has_many :grades
  belongs_to :roster

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    student_hash = row.to_hash
    student = Student.where(uid: product_hash["uid"])

    if student.count == 1
      product.first.update_attributes(student_hash)
    else
      Student.create!(student_hash)
    end
  end
end
