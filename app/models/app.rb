class App < ApplicationRecord
	mount_uploader :manual, FileUploader
	validates :name, presence: true
  default_scope {order :name}
end
