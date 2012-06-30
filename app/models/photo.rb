class Photo
  include Mongoid::Document
  embedded_in :project
  mount_uploader :image, ImageUploader
  attr_accessible :image, :image_cache
end