class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :account
  embeds_many :photos
  field :name, type: String
  scope :in_account, lambda {|account| where(account_id: account.id)}
end