class CreateMenuMenuItem < ActiveRecord::Migration[8.0]
	def change
			create_join_table :menu, :menu_item do |t|
					t.index :menu_id
					t.index :menu_item_id
			end
	end
end
