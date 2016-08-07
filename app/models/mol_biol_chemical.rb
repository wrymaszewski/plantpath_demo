class MolBiolChemical < ApplicationRecord
	validates :name, presence: true

	def self.to_csv
      attributes = %W{name producer catalogue_number rodzaj quantity delivery_date place comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end

end
