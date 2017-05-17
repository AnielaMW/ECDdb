Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dances#index'

  resources :users
  resources :dances do
    resources :dance_comments, only: [:new, :create]
    resources :dance_directions
  end
  resources :dance_comments, except: [:new, :create]
  resources :formations
  resources :meters
  resources :comment_types

  namespace :api do
<<<<<<< HEAD
    resources :dance_comments, only: [:create]
    resources :dances, only: [:create]
=======
    resources :dance_comments, only: [:create, :destroy]
>>>>>>> ba217c524692aa75c70584c638910b5e431f04f9
  end
end
