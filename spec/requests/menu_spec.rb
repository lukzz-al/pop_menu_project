require 'rails_helper'

RSpec.describe "Menu", type: :request do
	describe 'Menu CRUD actions' do
			it_behaves_like 'a CRUD request', 'Menu'
	end

	describe 'Menu API actions' do
		describe 'POST /menu' do
			context 'create a menu associated to a restaurant' do
				let(:restaurant) { create(:restaurant) }
				let(:menu_params) { attributes_for(:menu, restaurant_id: restaurant.id) }

				it 'creates a menu' do
					post '/menu', params: menu_params

					json_reponse = JSON.parse(response.body)
					expect(response).to have_http_status(:created)

					expect(json_reponse['name']).to eq(menu_params[:name])
					expect(Menu.find(json_reponse['id']).restaurant).to eq(restaurant)
				end
			end

			context 'create a menu with some menu_items' do
				let(:menu_items) { create_list(:menu_item, 3) }
				let(:menu_params) { attributes_for(:menu) }

				it 'creates a menu with menu_items' do
					menu_params[:menu_item_ids] = menu_items.map(&:id)
					post '/menu', params: menu_params

					json_reponse = JSON.parse(response.body)
					expect(response).to have_http_status(:created)
					expect(json_reponse['name']).to eq(menu_params[:name])
					expect(json_reponse['menu_items'].count).to eq(menu_items.count)
					expect(Menu.find(json_reponse['id']).menu_items).to eq(menu_items)
				end
			end
		end
	end
end
