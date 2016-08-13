class VectorAttachment < ApplicationRecord
  belongs_to :vector
  mount_uploader :file, FileUploader
  validates :name, presence: true
  # validates :file_type, presence: true
end
