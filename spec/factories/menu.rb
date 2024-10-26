FactoryBot.define do
	factory :menu do
		name { FFaker::Name.name }
		description { FFaker::Lorem.sentence }
	end
end
