class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :category
  has_and_belongs_to_many :comments
end
