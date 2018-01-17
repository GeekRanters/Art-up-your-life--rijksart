class Tag < ActiveRecord::Base
  has_many :artobjects_tags
  has_many :artobjects, through: :artobjects_tags
end
