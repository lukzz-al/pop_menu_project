class MenuItem < ApplicationRecord
	validates :name, :price, :available, :category, presence: true

	has_many :menu_menu_items, class_name: "MenuMenuItem", dependent: :destroy, inverse_of: :menu_item

	enum :category, { appetizer: "appetizer", entree: "entree", dessert: "dessert", beverage: "beverage", side: "side" }
end
