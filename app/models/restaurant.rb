class Restaurant < ApplicationRecord
	belongs_to :imported_item, optional: true

	has_many :menus

	validates :name, :address, :phone_number, presence: true
end
