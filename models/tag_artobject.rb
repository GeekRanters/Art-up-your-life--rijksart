class TagArtObject < ActiveRecord::Base
  belongs_to :artobject
  belongs_to :tag
end
