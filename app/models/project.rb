class Project
  include Mongoid::Document
  belongs_to :account
  has_many :photos
  field :name, type: String
  scope :in_account, lambda {|account| where(account_id: account.id)}
end