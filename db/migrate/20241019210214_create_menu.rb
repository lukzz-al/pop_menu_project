class CreateMenu < ActiveRecord::Migration[8.0]
	def change
			create_table :menus do |t|
					t.string :name
					t.string :description
					t.decimal :price
					t.string :image_url
					t.timestamps
			end
	end
end
