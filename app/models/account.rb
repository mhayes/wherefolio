class Account
  include Mongoid::Document
  
  mount_uploader :logo, LogoUploader
  
  attr_accessible :name, :logo, :logo_cache
  
  field :name, type: String
  belongs_to :user
end