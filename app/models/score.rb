class Score < ActiveRecord::Base
  belongs_to :grade
  belongs_to :category
  has_one :student, through: :grade
  has_and_belongs_to_many :comments
end
