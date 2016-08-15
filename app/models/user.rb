class User < ApplicationRecord
	has_secure_password
	validates :username, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true

	def self.to_csv
      attributes = %W{first_name last_name username}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
    end

end
