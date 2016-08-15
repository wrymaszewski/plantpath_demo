class Responsibility < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :action, presence: true
  default_scope {order :date_of_action}

	def self.to_csv
      attributes = %W{first_name last_name action date_of_action comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
  end
  def default_color
    if self.color == ''
      self.color = "black"
    end
    self.save
  end
end
