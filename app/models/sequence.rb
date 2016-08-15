class Sequence < ActiveRecord::Base
	has_many :bacteria
	has_many :primers
	has_many :sequence_attachments	
	has_many :bacterial_stocks
	validates :name, presence: true
	# default_scope {order :name}

	def change_names
		seq_id = self.id
		seq_name = self.name
		self.primers.each do |primer|
			primer.gene_sequence = seq_name
			primer.save
		end
		self.bacterial_stocks.each do |stock|
			stock.sequence_name = seq_name
			stock.save
		end
	end

	def self.to_csv
      attributes = %W{name organism comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
    end
end
