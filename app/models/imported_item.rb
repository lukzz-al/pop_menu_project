class ImportedItem < ApplicationRecord
	belongs_to :imported_list

	validates :item_type, presence: true
	validates :status, presence: true
	validates :action, presence: true

	enum :action, { added: "added", updated: "refreshed" }
	enum :status, { pending: "pending", success: "success", error: "error" }
	enum :item_type, { restaurant: "restaurant", menu: "menu", menu_item: "menu_item" }
end
