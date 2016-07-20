class Primer < ActiveRecord::Base
	belongs_to :sequence
  validates :name, presence: true
  validates :p_sequence, presence: true
  validates :gene_sequence, presence: true

	def calculate_tm
		seq = self.p_sequence
    g=0
    a=0
    t=0
    c=0
    seq.each_char do |i|
      if i=="A"
        a = a+1
      elsif i=="G"
        g = g+1
      elsif i=="T" || i=="U"
        t = t+1
      elsif i=="C"
        c = c+1
      end     
    end 
    if self.p_sequence.length < 14
      self.Tm = (at*2) + (gc*4)
    elsif self.p_sequence.length > 13
      self.Tm = 64.9+((41*(g+c-16.4))/(a+t+g+c))
    end
    self.save
  end

  def refine
  	seq = self.p_sequence.upcase.gsub(/\s+/, "")
   	self.p_sequence = seq
   	self.save
  end

  def fill_sequence_name
   	self.gene_sequence = Sequence.where({id: self.sequence_id}).pluck(:name)[0].to_s
   	self.save
 	end

 	def calculate_length
 		self.length = self.p_sequence.length
 		self.save
  end

    

 #    def calculate_product_size
 #    	if self.where({checked: true}).count==2
	#     	if self.where({checked: true, direction: 'reverse'}).count==1 && 
	#     		self.where({checked: true, direction: 'forward'}).count==1
	#     		forward_pos = self.where({checked: true, direction: 'forward'}).position
	#     		reverse_pos = self.where({checked: true, direction: 'reverse'}).position
	#     		sum = forward_pos+reverse_pos
	#     		return "Amplicon size is: #{sum} bp"
	#     	else
	#     		return "Select one forward and one reverse primer"
	#     	end
	#     elsif self.where({checked: true}).count>2
	#     	return "To many primers selected"
	#     else
	#     	return "Select primers"
	#     end
	# end

end
