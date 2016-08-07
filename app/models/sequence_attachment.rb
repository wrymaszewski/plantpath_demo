class SequenceAttachment < ActiveRecord::Base
	mount_uploader :file, FileUploader
	belongs_to :sequence
	validates :file, presence: true
	validates :sequence_type, presence: true
end
