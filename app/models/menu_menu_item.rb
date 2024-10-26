class MenuMenuItem < ApplicationRecord
	self.table_name = "menu_menu_item"

	belongs_to :menu
	belongs_to :menu_item

	validates :menu_id, uniqueness: { scope: :menu_item_id }
	validates :menu_item_id, uniqueness: { scope: :menu_id }

	validates :menu_id, :menu_item_id, presence: true
end
