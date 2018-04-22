Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/login', to: 'admin#login'
  post '/burger_fill_create', to: 'admin#create'
  delete '/burger_fill_destroy', to: 'admin#destroy'
  patch '/burger_fill_update', to: 'admin#update'
  patch '/admin/update_bread', to: 'admin#update'
  delete '/admin/delete_bread', to: 'admin#destroy'
  post '/admin/create_bread', to: 'admin#create'
  post '/admin/new_burger_fill_type', to: 'admin#create'
  post '/admin/update_burger_fill_type', to: 'admin#update'
  delete '/admin/delete_burger_fill_type', to: 'admin#destroy'
  post '/session', to: 'sessions#create'
  resources :home
  resources :admin
  resources :photos
  resources :welcome_data
  resources :contact
  resources :galery
  resources :menu
  resources :email_contact
  resources :social_medias
  resources :burger_type


end
