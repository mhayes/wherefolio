class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  embedded_in :project
  mount_uploader :image, ImageUploader
  field :name
  field :position, type: Integer, default: 0
  attr_accessible :image, :image_cache, :name, :project_id, :position
  scope :ordered, order_by(:position, :asc)
end