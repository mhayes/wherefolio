class User
  include Mongoid::Document
  field :name, type: String
  field :twitter_uid, type: String
  field :twitter_nickname, type: String
  field :twitter_name, type: String
  field :twitter_image, type: String
end