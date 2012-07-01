class Photo
  include Mongoid::Document
  belongs_to :project
  mount_uploader :image, ImageUploader
  field :name
  attr_accessible :image, :image_cache, :name, :project_id
end