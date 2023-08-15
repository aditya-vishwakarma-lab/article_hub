Rails.application.routes.draw do
  resources :readers, only: [:index, :edit, :update]
  get 'static_pages/landing_page'
  devise_for :admins
  devise_for :authors
  devise_for :readers


  resources :articles do
    resources :comments, only: %i[create]
  end

  get '/search', to: 'articles#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#landing_page"
end
