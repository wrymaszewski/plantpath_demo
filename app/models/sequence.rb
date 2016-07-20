class Sequence < ActiveRecord::Base
	has_many :bacteria
	has_many :primers
	# accepts_nested_attributes_for :sequence_attachments
	has_many :sequence_attachments	
	has_many :bacterial_stocks
	validates :name, presence: true

def calculate_product_size
    	if self.primers.where({checked: true}).count==2
	    	if self.primers.where({checked: true, direction: 'reverse'}).count==1 && 
	    		self.primers.where({checked: true, direction: 'forward'}).count==1
	    		forward_pos = self.primers.where({checked: true, direction: 'forward'}).position
	    		reverse_pos = self.primers.where({checked: true, direction: 'reverse'}).position
	    		sum = forward_pos+reverse_pos
	    		return "Amplicon size is: #{sum} bp"
	    	else
	    		return "Select one forward and one reverse primer"
	    	end
	    elsif self.primers.where({checked: true}).count>2
	    	return "To many primers selected"
	    else
	    	return "Select primers"
	    end
	end

end
