class User
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  geocoded_by :twitter_location
  before_save :update_coordinates
  
  field :twitter_uid, type: String
  field :twitter_nickname, type: String
  field :twitter_name, type: String
  field :twitter_image, type: String
  field :twitter_location, type: String
  field :coordinates, type: Array
  
  alias :name :twitter_name
  has_one :account

private
  def update_coordinates
    if address.present? && address_changed?
      geocode
    end
  end
end