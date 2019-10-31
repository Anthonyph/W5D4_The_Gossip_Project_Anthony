Rails.application.routes.draw do
  resources :gossips
  resources :users
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome/:first_name/', to: "welcome#name"
  get '/team', to: "static_pages#team"
  get '/contact', to: "static_pages#contact"
  get '/deletedcomment', to: "static_pages#deletedcomment"
end
