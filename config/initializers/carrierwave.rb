S3 = YAML::load_file("#{Rails.root}/config/s3.yml")[Rails.env.to_s].symbolize_keys!

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => S3[:access_key_id],
    :aws_secret_access_key  => S3[:secret_access_key]
    # :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = S3[:bucket]
  config.fog_host       = "http://#{S3[:bucket]}"
  # config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end