class User < ActiveRecord::Base
  has_many :grades
  authenticates_with_sorcery!

  validates :password, :presence => true, :confirmation => true, :on => :update
  validates :first_name, :presence => true, :on => :update
  validates :last_name,  :presence => true, :on => :update
  validates_uniqueness_of :email
  #Allows user to be created without until activated password using sorcery gem
  before_create :setup_activation
  #Sorcery method to set external auth (Oauth) to false
  def external?
    false
  end
end
