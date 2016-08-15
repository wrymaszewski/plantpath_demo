class CompetentCell < ApplicationRecord
	validates :strain, presence: true
	validates :species, presence: true
  default_scope {order :strain}

	def self.to_csv
      attributes = %W{place species strain genotype antibiotic_resistance usage comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end
end
