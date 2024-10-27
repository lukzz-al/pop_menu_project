require 'rails_helper'

RSpec.describe "Restaurant", type: :request do
	describe 'Restaurant CRUD actions' do
		it_behaves_like 'a CRUD request', 'Restaurant'
	end
end
