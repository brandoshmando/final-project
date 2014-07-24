class Category < ActiveRecord::Base
  has_many :comments
  has_many :grades
  belongs_to :eval, touch: true
  accepts_nested_attributes_for :comments
end
