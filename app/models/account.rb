class Account
  include Mongoid::Document
  
  attr_accessible :name
  
  field :name, type: String
  belongs_to :user
end