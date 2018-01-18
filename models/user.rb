class User < ActiveRecord::Base
  has_secure_password
  has_many :user_artobjects
  has_many :artobjects, through: :user_artobjects
end
