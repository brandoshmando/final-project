class Score < ActiveRecord::Base
  belongs_to :category
  belongs_to :grade
  has_one :student, through: :grade
  has_and_belongs_to_many :comments
end
