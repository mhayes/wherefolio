class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  belongs_to :account
  embeds_many :photos
  field :name, type: String
  field :address
  field :coordinates, type: Array
  geocoded_by :address
  before_save :update_coordinates
  scope :in_account, lambda {|account| where(account_id: account.id)}

private
  def update_coordinates
    if address.present? && address_changed?
      geocode
    end
  end
end