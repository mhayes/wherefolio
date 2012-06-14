class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [250,250]
  version :square do
    process resize_to_fill:[100,100]
  end
  
  # process resize_to_fit: [2048, nil]
  # 
  # version :large {process resize_to_fill:[1024,nil]}
  # version :medium, from_version: :large {process resize_to_fill:[800,nil]}
  # version :small, from_version: :medium {process resize_to_fill:[400,nil]}
  # version :square, from_version: :small {process resize_to_fit:[200,200]}
  
  def store_dir
    'logos'
  end
  
  def filename
    random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)
    ivar = "@#{mounted_as}_secure_token"    
    token = model.instance_variable_get(ivar)
    token ||= model.instance_variable_set(ivar, random_token)
    "#{model.id}_#{token}.jpg" if original_filename
  end
end