FactoryBot.define do
	factory :imported_item do
		item_type { "menu_item" }
		status { "pending" }
		action { "added" }
	end
end
