class Comment < ActiveRecord::Base
  belongs_to :category, touch: true
  has_and_belongs_to_many :grades
end
