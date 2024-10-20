class MenuItemController < ApplicationController
	def index
		pagy, menu_items = pagy(MenuItem.all)

		render json: { items: menu_items, total: pagy.count, pages: pagy.pages, page: pagy.page }, status: :ok
	end

	def show
		render json: MenuItem.find(params[:id]), status: :ok
	end

	def create
		menu_item = MenuItem.new(menu_item_params)
		return render json: { errors: menu_item.errors.full_messages }, status: :unprocessable_entity if menu_item.invalid?

		menu_item.save
		render json: menu_item, status: :created
	end

	def update
		menu_item = MenuItem.find(params[:id])
		return render json: { errors: menu_item.errors.full_messages }, status: :unprocessable_entity unless menu_item.update(menu_item_params)

		render json: menu_item, status: :ok
	end

	def destroy
		menu_item = MenuItem.find(params[:id])
		menu_item.destroy

		head :ok
	end

	private
	def menu_item_params
			params.permit(:name, :price, :description, :available, :is_vegetarian, :image_url, :category)
	end
end
