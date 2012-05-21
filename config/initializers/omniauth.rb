twitter = YAML::load_file("#{Rails.root}/config/twitter.yml")[Rails.env].symbolize_keys!

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, twitter[:consumer_key], twitter[:consumer_secret], authorize_params: {force_login: 'true'}
end