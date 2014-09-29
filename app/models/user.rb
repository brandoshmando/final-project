class User < ActiveRecord::Base
  has_many :grades
  authenticates_with_sorcery!
  attr_accessor :remove_avatar
  TYPES = %i[professor assistant]
  # has_secure_password
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email,  presence: true

  has_attached_file :avatar, styles: { :medium => "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type:/\Aimage\/.*\Z/
  before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }
  # validates_uniqueness_of :email - this line was throwing log in errors because of the faker gem duplicating emails in the database
  #Allows user to be created without until activated password using sorcery gem
  before_save { self.email.downcase! }
  before_create :setup_activation
  #Sorcery method to set external auth (Oauth) to false
  def external?
    false
  end
#Checks how many grades you have created in the last 3 days
  def grades_last_three
    self.grades.where("created_at > ?", (Time.now - 3.day)).count
  end
#Scope that returns currently active rosters on a per user basis
  def active_rosters
    date = Time.now
    self.rosters.includes(:course).where(('start_date <= ? AND end_date >= ?'), date, date)
  end

  def upcoming_rosters
    date = Time.now
    self.rosters.includes(:course).where(('start_date > ?'), date)
  end

  def recent_rosters
    date = Time.now
    self.rosters.includes(:course).where(('end_date < ? AND end_date < end_date + ?'), date, 31.day)
  end

  private
  def delete_avatar
    self.avatar = nil
  end
end
