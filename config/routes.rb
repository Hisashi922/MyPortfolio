Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/edit'
  devise_for :users
  #get 'homes/top'
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :projects, only: [:index, :show, :create, :destroy]
  resources :projects do
    resources :comments, only: [:create]
  end
end
