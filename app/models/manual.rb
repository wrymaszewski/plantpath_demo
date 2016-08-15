class Manual < ApplicationRecord
	mount_uploader :file, FileUploader
	validates :file, presence: true
	validates :name, presence: true
  default_scope {order :name}

	def self.to_csv
      attributes = %W{name author file comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
    end
end
