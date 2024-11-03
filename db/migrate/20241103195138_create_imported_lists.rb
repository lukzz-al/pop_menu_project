class CreateImportedLists < ActiveRecord::Migration[8.0]
	def change
		create_table :imported_lists do |t|
			t.string :file_name
			t.string :file_url
			t.string :status, default: "pending"
			t.string :error_message
			t.integer :total_rows
			t.integer :imported_rows
			t.integer :failed_rows
			t.string :imported_by

			t.timestamps
		end
	end
end
