require 'rails_helper'

RSpec.describe ImportedItem, type: :model do
	describe 'validations' do
		it { should validate_presence_of(:item_type) }
		it { should validate_presence_of(:status) }
		it { should validate_presence_of(:action) }
	end

	describe 'associations' do
		it { should belong_to(:imported_list) }
	end
end
