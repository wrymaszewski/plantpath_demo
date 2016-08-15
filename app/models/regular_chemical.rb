class RegularChemical < ApplicationRecord
	validates :short_name, presence: true
  default_scope {order :short_name}

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

  def what_state
    if self.state == 1
      return "almost_empty"
    elsif self.state == 2
      return "empty"
    end      
  end

end
