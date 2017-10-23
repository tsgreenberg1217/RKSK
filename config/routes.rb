Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :packs, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end