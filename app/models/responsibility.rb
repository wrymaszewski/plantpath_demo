class Responsibility < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :action, presence: true
end
