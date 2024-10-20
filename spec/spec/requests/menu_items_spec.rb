require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
	describe 'MenuItem CRUD actions' do
			it_behaves_like 'a CRUD request', 'MenuItem'
	end
end
