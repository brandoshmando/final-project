class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_secure_password
end
