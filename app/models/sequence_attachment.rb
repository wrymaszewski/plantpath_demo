class SequenceAttachment < ActiveRecord::Base
	mount_uploader :file, FileUploader
	belongs_to :sequence
	validates :file, presence: true
	validates :sequence_type, presence: true

	def self.to_csv
      attributes = %W{name sequence_type comment}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
    end
    
end

