class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :incoming_transformation

  private

  def incoming_transformation
    { transformation: transformations }
  end

  def transformations
    @transformations = []

    if model.photo_crop_w > 0 && model.photo_crop_h > 0
      @transformations << custom_crop
    end

    @transformations <<  default_resize_to_fill
  end

  def custom_crop
    {
      x: model.photo_crop_x,
      y: model.photo_crop_y,
      width: model.photo_crop_w,
      height: model.photo_crop_h,
      crop: :crop
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
