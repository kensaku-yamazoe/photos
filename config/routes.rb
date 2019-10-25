Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "user/:id", :to => "photos#index"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'photos#index'
  resources :photos, only:[:index,:show,:new,:create]

  resources :users, only: [:show, :destroy, :edit, :update] 

end
