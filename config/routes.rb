Rails.application.routes.draw do
  #get 'projects/index'
  #get 'projects/show'
  #get 'projects/create'
  #get 'users/show'
  #get 'users/edit'
  devise_for :users
  #get 'homes/top'
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :projects, only: [:new, :index, :show, :create, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
