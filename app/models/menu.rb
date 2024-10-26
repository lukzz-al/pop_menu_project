class Menu < ApplicationRecord
	has_many :menu_menu_items, class_name: "MenuMenuItem"
	has_many :menu_items, through: :menu_menu_items

	validates :name, uniqueness: true, presence: true
end
