class CreateMenuItem < ActiveRecord::Migration[8.0]
	def change
			create_table :menu_items do |t|
					t.string :name
					t.string :description
					t.decimal :price
					t.string :image_url
					t.string :category
					t.boolean :available
					t.boolean :is_vegetarian
					t.timestamps
			end
	end
end
