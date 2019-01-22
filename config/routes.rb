Rails.application.routes.draw do

  resources :books do
    resources :chapters
  end
  root 'users#home'
  # get '/home', to: 'users#home', as: "home"
  get '/welcome', to: 'users#index', as: "welcome"
  post '/add_favorite', to: 'users#add_favorite', as: "add_favorite"
  post '/remove_favorite', to: 'users#remove_favorite', as: "remove_favorite"
  get '/my-books', to: 'books#my_books', as: "my-books"
  get '/review/:id', to: 'books#review_illustrations', as: "review"
  get '/favorites',  to: 'favorites#index', as: "favorites"


  resources :illustrations
  resources :sessions
  resources :users do
    member do
      get :confirm_email
    end
  end

  
  get 'logout', to: 'sessions#destroy', as: 'logout'
  default_url_options :host => 'localhost:3000' # TODO need to review this
  get "/all_books", to: "books#all_books"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

