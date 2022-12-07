Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create, :update, :edit, :destroy] do
    resources :restaurant_dishes, only: [:index, :new, :create, :edit, :update, :sort]
    resources :restaurant_moredishes, only: [:index]
  end
  get '/', to: 'welcome#index'

  resources :dishes, only: [:index, :show, :edit, :update]
end
