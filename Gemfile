source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'jquery-rails'
gem 'mongoid', '~> 2.4'
gem 'bson_ext', '~> 1.5'
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'mini_magick'

# External APIs
gem 'omniauth', '~> 1.1.0'
gem 'omniauth-twitter'
gem 'fog', '~> 1.3.1'
gem 'geocoder', '~> 1.1.2'
# gem 'mongoid_spatial', '~> 0.2.16'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'backbone-on-rails'
end

group :development do 
  gem 'capistrano'
  gem 'debugger'
  gem 'quiet_assets'
  gem 'thin'
end

gem 'factory_girl_rails', '~> 3.2.0', :group => [:development, :test]

group :test do
  gem 'minitest-spec-rails', '~> 3.0.1'
  gem 'capybara_minitest_spec', '~> 0.2.1'
  gem 'capybara', '~> 1.1.2'
  gem 'poltergeist', '~> 0.6.0'
  gem 'launchy'
  gem 'tork', '~> 18.2.0'
end

group :production do
  gem 'unicorn'
  gem 'exception_notification'
end