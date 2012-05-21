FactoryGirl.define do
  factory :user do
    twitter_uid {SecureRandom.uuid}
    twitter_nickname "mhayes"
    twitter_name "Mark Hayes"
    twitter_image "http://placehold.it/100x100"
    twitter_location "Campbell, CA"
  end
end