class User
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  geocoded_by :twitter_location
  after_validation :geocode
  
  field :twitter_uid, type: String
  field :twitter_nickname, type: String
  field :twitter_name, type: String
  field :twitter_image, type: String
  field :twitter_location, type: String
  field :coordinates, type: Array
  
  alias :name :twitter_name
  has_one :account
end