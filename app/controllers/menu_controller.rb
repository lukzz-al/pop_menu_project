class MenuController < ApplicationController
	def index
		pagy, menu = pagy(Menu.eager_load(:menu_items))

		render json: { items: menu.as_json(include: :menu_items), total: pagy.count, pages: pagy.pages, page: pagy.page }, status: :ok
	end

	def show
		render json: Menu.find(params[:id]).as_json(include: :menu_items), status: :ok
	end

	def create
		menu = Menu.new(menu_params)

		if menu.save
			if params[:menu_item_ids].present?
				menu.menu_items << MenuItem.where(id: params[:menu_item_ids])
			end

			render json: menu.as_json(include: :menu_items), status: :created
		else
			render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		menu = Menu.find(params[:id])
		return render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity unless menu.update(menu_params)

		render json: menu.as_json(include: :menu_items), status: :ok
	end

	def destroy
		menu = Menu.find(params[:id])
		menu.destroy

		render json: menu.as_json(include: :menu_items), status: :ok
	end

	private
	def menu_params
		params.permit(:name, :description, :price, :image_url, :restaurant_id)
	end
end
