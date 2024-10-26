class MenuItem < ApplicationRecord
	validates :name, :price, :available, :category, presence: true

	enum :category, { appetizer: "appetizer", entree: "entree", dessert: "dessert", beverage: "beverage", side: "side" }
end
