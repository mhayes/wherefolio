class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [2048, 2048]
  
  version :large do
    process resize_to_limit:[1024,nil]
  end
  
  version :medium, from_version: :large do
    process resize_to_limit:[800,nil]
  end
  
  version :small, from_version: :medium do
    process resize_to_limit:[400,nil]
  end
  
  version :thumbnail, from_version: :small do
    process resize_to_fill:[160,120]
  end
  
  version :square, from_version: :small do
    process resize_to_fill:[100,100]
  end
  
  def store_dir
    'images'
  end
  
  def filename
    random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)
    ivar = "@#{mounted_as}_secure_token"    
    token = model.instance_variable_get(ivar)
    token ||= model.instance_variable_set(ivar, random_token)
    "#{model.id}_#{token}.jpg" if original_filename
  end
end