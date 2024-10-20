require 'rails_helper'

RSpec.describe "Menu", type: :request do
	describe 'Menu CRUD actions' do
			it_behaves_like 'a CRUD request', 'Menu'
	end
end
