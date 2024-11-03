require 'rails_helper'

RSpec.describe ImportedList, type: :model do
	context 'validations' do
		it { should validate_presence_of(:file_url) }
		it { should validate_presence_of(:status) }
	end

	context 'associations' do
		it { should have_many(:imported_items).dependent(:destroy) }
	end
end
