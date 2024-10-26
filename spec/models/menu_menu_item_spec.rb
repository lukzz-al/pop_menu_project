require "rails_helper"

RSpec.describe MenuMenuItem, type: :model do
	describe "associations" do
		it { should belong_to(:menu) }
		it { should belong_to(:menu_item) }
	end

	describe "validations" do
		it { should validate_presence_of(:menu_id) }
		it { should validate_presence_of(:menu_item_id) }
	end
end
