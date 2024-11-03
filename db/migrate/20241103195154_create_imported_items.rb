class CreateImportedItems < ActiveRecord::Migration[8.0]
	def change
		create_table :imported_items do |t|
			t.references :imported_list, null: false, foreign_key: true
			t.string :item_type
			t.string :status, default: "pending"
			t.string :error_message
			t.string :action

			t.timestamps
		end
	end
end
