Rails.application.routes.draw do
	get "up" => "rails/health#show", as: :rails_health_check

	resources :menu_item
	resources :menu
	resources :restaurant
end
