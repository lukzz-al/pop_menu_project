class RestaurantController < ApplicationController
	def index
		pagy, restaurants = pagy(Restaurant.all)

		render json: { items: restaurants, total: pagy.count, pages: pagy.pages, page: pagy.page }, status: :ok
	end

	def show
		render json: Restaurant.find(params[:id]), status: :ok
	end

	def create
		restaurant = Restaurant.new(restaurant_params)
		return render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity if restaurant.invalid?

		restaurant.save
		render json: restaurant, status: :created
	end

	def update
		restaurant = Restaurant.find(params[:id])
		return render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity unless restaurant.update(restaurant_params)

		render json: restaurant, status: :ok
	end

	def destroy
		restaurant = Restaurant.find(params[:id])
		restaurant.destroy

		head :ok
	end

	private
	def restaurant_params
			params.permit(:name, :menu_id, :address, :description, :phone_number, :image_url)
	end
end
