class CreateRestaurant < ActiveRecord::Migration[8.0]
	def change
		create_table :restaurants do |t|
			t.string :name
			t.string :description
			t.string :address
			t.string :phone_number
			t.string :image_url

			t.timestamps
		end
	end
end
