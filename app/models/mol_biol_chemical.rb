class MolBiolChemical < ApplicationRecord
	validates :name, presence: true
  # default_scope {order :name}

	def self.to_csv
      attributes = %W{name producer catalogue_number rodzaj quantity delivery_date place comments}
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
