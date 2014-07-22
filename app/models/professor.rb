class Professor < User
  has_many :courses
  has_many :evals
end
