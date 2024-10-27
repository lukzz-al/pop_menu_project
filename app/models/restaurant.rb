class Restaurant < ApplicationRecord
	has_many :menus

	validates :name, :address, :phone_number, presence: true
end
