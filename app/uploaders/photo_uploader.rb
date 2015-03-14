class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :custom_crop

  version :thumbnail do
    process :default_resize_to_fill
  end

  private

  def custom_crop
    {
      transformation: [
        {
          x: model.photo_crop_x,
          y: model.photo_crop_y,
          width: model.photo_crop_w,
          height: model.photo_crop_h,
          crop: :crop
        },
        {
          width: 200,
          height: 200,
          crop: :scale
        }
      ]
    }
  end

  def default_resize_to_fill
    {
      width: 200,
      height: 200,
      gravity: 'north_west',
      crop: :fill
    }
  end
end
