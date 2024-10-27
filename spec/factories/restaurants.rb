FactoryBot.define do
	factory :restaurant do
		name { FFaker::Name.name }
		address { FFaker::Address.street_address }
		phone_number { FFaker::PhoneNumber.phone_number }
	end
end
