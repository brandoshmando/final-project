class Assistant < User
  has_and_belongs_to_many :courses, join_table: 'assistants_courses'
  #Redefines model name method to return User.model_name instead. This lets each class use its parents path helpers
  def self.model_name
    User.model_name
  end
end
