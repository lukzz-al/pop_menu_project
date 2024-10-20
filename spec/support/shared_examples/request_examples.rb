RSpec.shared_examples 'a CRUD request' do |model_name|
	let(:model_class) { model_name.constantize }
	let(:resource_list) { create_list(model_name.underscore.to_sym, 5) }
	let(:resource) { create(model_name.underscore.to_sym) }

	describe 'GET /index' do
			before { resource_list }

			it 'returns a list of resources' do
					get "/#{model_name.underscore}"
					json_response = JSON.parse(response.body)

					expect(response).to have_http_status(:ok)
					expect(json_response).to have_key("items")
					expect(json_response).to have_key("total")
					expect(json_response).to have_key("pages")
					expect(json_response).to have_key("page")
					expect(json_response["items"].length).to eq(5)
			end
	end

	describe 'GET /show' do
			it 'returns the specified resource' do
					get "/#{model_name.underscore}/#{resource.id}"
					json_response = JSON.parse(response.body)

					expect(response).to have_http_status(:ok)
					expect(json_response['id']).to eq resource.id
			end
	end

	describe 'POST /create' do
			let(:valid_params) { attributes_for(model_name.underscore.to_sym) }

			it 'creates a new resource' do
					expect {
						post "/#{model_name.underscore}", params: valid_params
					}.to change(model_class, :count).by(1)
					expect(response).to have_http_status(:created)
			end
	end

	describe 'PUT /update' do
			let(:update_params) { { name: 'Updated Name' } }

			it 'updates the resource' do
					put "/#{model_name.underscore}/#{resource.id}", params: update_params
					expect(response).to have_http_status(:ok)
					expect(resource.reload.name).to eq('Updated Name')
			end
	end

	describe 'DELETE /destroy' do
			it 'deletes the resource' do
					delete "/#{model_name.underscore}/#{resource.id}"
					expect(response).to have_http_status(:ok)
					expect(model_class.exists?(resource.id)).to be_falsey
			end
	end

	describe 'invalid update request' do
			let(:invalid_params) { { model_class.required_attributes.first => nil } }

			it 'returns an error' do
					post "/#{model_name.underscore}", params: invalid_params
					json_response = JSON.parse(response.body)

					if model_class.required_attributes.any?
						expect(response).to have_http_status(:unprocessable_entity)
						expect(json_response).to have_key('errors')
					else
						expect(response).to have_http_status(:created)
					end
			end
	end
end
