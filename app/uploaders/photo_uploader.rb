class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumbnail do
    process resize_to_fill: [200, 200, 'north_west']
  end
end
