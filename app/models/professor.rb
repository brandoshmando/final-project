class Professor < User
  has_many :courses
  has_many :evals

  #Redefines model name method to return User.model_name instead. This lets each class use its parents path helpers
  def self.model_name
    User.model_name
  end
end
