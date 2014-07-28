class Score < ActiveRecord::Base
  attr_accessor :category

  belongs_to :grade
  has_one :student, through: :grade
  has_and_belongs_to_many :comments
end
