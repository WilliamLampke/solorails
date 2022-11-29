Rails.application.routes.draw do
  resources :restaurants, only: %i[index show] do
    resources :dishes, only: [:index]
  end

  resources :dishes, only: [:index, :show]
end
