class RegularChemical < ApplicationRecord
	validates :short_name, presence: true

	def self.to_csv
      attributes = %W{short_name full_name formula producer catalogue_number delivery_date place
      	quantity comments rodzaj}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end
end
