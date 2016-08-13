# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return model.name
  end
end
