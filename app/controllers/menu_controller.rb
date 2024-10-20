class MenuController < ApplicationController
	def index
		pagy, menu = pagy(Menu.all)

		render json: { items: menu, total: pagy.count, pages: pagy.pages, page: pagy.page }, status: :ok
	end

	def show
		render json: Menu.find(params[:id]), status: :ok
	end

	def create
		menu = Menu.new(menu_params)
		return render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity if menu.invalid?

		menu.save
		render json: menu, status: :created
	end

	def update
		menu = Menu.find(params[:id])
		return render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity unless menu.update(menu_params)

		render json: menu, status: :ok
	end

	def destroy
		menu = Menu.find(params[:id])
		menu.destroy

		render json: menu, status: :ok
	end

	private
	def menu_params
		params.permit(:name, :description, :price, :image_url)
	end
end
