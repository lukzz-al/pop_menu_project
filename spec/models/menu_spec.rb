require "rails_helper"

RSpec.describe Menu, type: :model do
	describe "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_uniqueness_of(:name) }
	end

	describe "associations" do
		it { should belong_to(:restaurant).optional }
		it { should belong_to(:imported_item).optional }
		it { should have_many(:menu_items).through(:menu_menu_items) }
		it { should have_many(:menu_menu_items).class_name("MenuMenuItem").dependent(:destroy).inverse_of(:menu) }
	end
end
