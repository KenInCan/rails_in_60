Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index", as: 'home'
  get 'about' => 'pages#about', as: 'about'
  get '/posts/new' => 'posts#new', as: 'new'

  resources :posts # allows url:posts_path in new.html.erb 
end
