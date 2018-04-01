Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
