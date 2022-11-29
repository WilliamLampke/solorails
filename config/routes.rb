Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    resources :dishes, only: [:index]
  end
  get '/', to: 'welcome#index'

  resources :dishes, only: [:index, :show]
end
