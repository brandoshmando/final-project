class User < ActiveRecord::Base
  has_many :grades
  authenticates_with_sorcery!
  attr_accessor :remove_avatar

  TYPES = %i[professor assistant]
  # has_secure_password

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }
  validates :first_name, :presence => true, :on => :update
  validates :last_name,  :presence => true, :on => :update
  validates :email,  :presence => true
  # validates_uniqueness_of :email - this line was throwing log in errors because of the faker gem duplicating emails in the database
  #Allows user to be created without until activated password using sorcery gem
  before_create :setup_activation
  #Sorcery method to set external auth (Oauth) to false
  def external?
    false
  end

  private
  def delete_avatar
    self.avatar = nil
  end
end