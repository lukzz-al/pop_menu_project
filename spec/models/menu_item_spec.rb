require "rails_helper"

RSpec.describe MenuItem, type: :model do
	describe "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
	end

	describe "associations" do
		it { should belong_to(:imported_item).optional }
		it { should have_many(:menu_menu_items).class_name("MenuMenuItem").dependent(:destroy).inverse_of(:menu_item) }
	end
end
