class Tag < ActiveRecord::Base
  has_many :tag_artobjects
  has_many :artobjects, through: :tag_artobjects
end
