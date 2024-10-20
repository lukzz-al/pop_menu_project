FactoryBot.define do
	factory :menu_item do
			name { FFaker::Food.meat }
			price { rand(1..100) }
			available { true }
			category { MenuItem.categories.keys.sample }
	end
end
