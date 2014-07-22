class Category < ActiveRecord::Base
  has_many :comments
  belongs_to :eval
end
