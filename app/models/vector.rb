class Vector < ApplicationRecord
	has_many :vector_attachments
	validates :name, presence: true

	def self.to_csv
      attributes = %W{name size antibiotic_resistance copy_number usage tag casette comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end
end
