class RegularChemical < ApplicationRecord
	validates :short_name, presence: true
end
