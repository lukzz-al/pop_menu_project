FactoryBot.define do
	factory :imported_list do
		file_url { FFaker::Internet.http_url }
		status { "pending" }
	end
end
