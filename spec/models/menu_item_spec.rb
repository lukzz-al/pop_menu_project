require "rails_helper"

RSpec.describe MenuItem, type: :model do
	describe "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
		it { should validate_presence_of(:menu_id) }
	end
end
