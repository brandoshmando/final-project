class User < ActiveRecord::Base
  authenticates_with_sorcery!

  TYPES = %i[professor assistant]
  # has_secure_password

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :password, :presence => true, :confirmation => true, :on => :update
  validates :first_name, :presence => true, :on => :update
  validates :last_name,  :presence => true, :on => :update

  # validates_uniqueness_of :email - this line was throwing log in errors because of the faker gem duplicating emails in the database
  #Allows user to be created without until activated password using sorcery gem
  before_create :setup_activation
  #Sorcery method to set external auth (Oauth) to false
  def external?
    false
  end
end
