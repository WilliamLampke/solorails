Rails.application.routes.draw do

resources :restaurants, only: [:index, :show]

resources :dishes, only: [:index]

end
 