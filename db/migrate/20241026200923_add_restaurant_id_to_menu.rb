class AddRestaurantIdToMenu < ActiveRecord::Migration[8.0]
	def change
		add_reference :menus, :restaurant, foreign_key: true
	end
end
