class BacterialStock < ApplicationRecord
	belongs_to :sequence
	validates :sequence_name, presence: true
	validates :number, presence: true
	validates :wstawka, presence: true
	
	def fill_sequence_name
    	self.sequence_name = Sequence.where({id: self.sequence_id}).pluck(:name)[0].to_s
    	self.save
   	end

end
