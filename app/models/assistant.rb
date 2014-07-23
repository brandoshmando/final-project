class Assistant < User
  belongs_to :course
  #Redefines model name method to return User.model_name instead. This lets each class use its parents path helpers
  def self.model_name
    User.model_name
  end
end
