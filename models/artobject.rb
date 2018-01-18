class Artobject < ActiveRecord::Base
  has_many :tag_artobjects
  has_many :tags, through: :tag_artobjects
  has_many :user_artobjects
  has_many :users, through: :user_artobjects
end
