class Primer < ActiveRecord::Base
	belongs_to :sequence
  validates :name, presence: true
  validates :p_sequence, presence: true
  validates :gene_sequence, presence: true
  # default_scope {order :gene_sequence}

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
      self.Tm = ((a+t)*2) + ((g+c)*4)
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

  def self.to_csv
      attributes = %w{name p_sequence direction length position Tm gene_sequence comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end
end
