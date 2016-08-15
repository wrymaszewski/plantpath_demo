class BacterialStock < ApplicationRecord
	belongs_to :sequence
	validates :sequence_name, presence: true
	validates :wstawka, presence: true
	# default_scope {order :sequence_names}

	def fill_sequence_name
    	self.sequence_name = Sequence.where({id: self.sequence_id}).pluck(:name)[0].to_s
    	self.save
   	end

   	def self.to_csv
   		attributes = %w{number wstawka sequence_name plasmid tag species strain antibiotic_resistance methods_of_cloning source comments place}
   		CSV.generate(headers: true) do |csv|
	   		csv << attributes

	   		all.each do |r|
	   			csv << attributes.map {|attr| r.send(attr)}
	   		end
	   	end
   	end
end

