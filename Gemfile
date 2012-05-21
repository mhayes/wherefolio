source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'jquery-rails'
gem 'mongoid', '~> 2.4'
gem 'bson_ext', '~> 1.5'

# OmniAuth
gem 'omniauth', '~> 1.1.0'
gem 'omniauth-twitter'

# Geocoding
gem 'geocoder', '~> 1.1.1'
# gem 'mongoid_spatial', '~> 0.2.16'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :development do 
  gem 'capistrano'
  gem 'capistrano-ext'
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
end

group :production do
  gem 'unicorn'
end