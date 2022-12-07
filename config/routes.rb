Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create, :update, :edit] do
    resources :restaurant_dishes, only: [:index, :new, :create, :edit, :update]
  end
  get '/', to: 'welcome#index'

  resources :dishes, only: [:index, :show]
end
