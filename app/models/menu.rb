class Menu < ApplicationRecord
	belongs_to :restaurant, optional: true

	has_many :menu_menu_items, class_name: "MenuMenuItem", inverse_of: :menu, dependent: :destroy
	has_many :menu_items, through: :menu_menu_items

	validates :name, uniqueness: true, presence: true
end
