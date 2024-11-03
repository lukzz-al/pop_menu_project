require 'rails_helper'

RSpec.describe Restaurant, type: :model do
	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:phone_number) }
	end

	describe 'associations' do
		it { should belong_to(:imported_item).optional }
		it { should have_many(:menus) }
	end
end
