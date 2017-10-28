Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :packs, only: [:create, :show, :edit, :update, :destroy, :index]
  resources :items, only: [:delete]
  get '/' => 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
