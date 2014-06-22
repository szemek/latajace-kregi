class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumbnail do
    process resize_to_limit: [200, 200]
  end
end
