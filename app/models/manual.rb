class Manual < ApplicationRecord
	mount_uploader :file, FileUploader
	validates :file, presence: true
	validates :name, presence: true

end
