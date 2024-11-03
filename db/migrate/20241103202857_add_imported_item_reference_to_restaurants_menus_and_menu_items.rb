class AddImportedItemReferenceToRestaurantsMenusAndMenuItems < ActiveRecord::Migration[8.0]
	def change
		add_reference :restaurants, :imported_item, foreign_key: true
		add_reference :menus, :imported_item, foreign_key: true
		add_reference :menu_items, :imported_item, foreign_key: true
	end
end
