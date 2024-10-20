require "rails_helper"

class MenuItemTest < ActiveSupport::TestCase
	describe "validations" do
			it { should validate_presence_of(:name) }
			it { should validate_presence_of(:price) }
			it { should validate_presence_of(:menu_id) }
	end
end
