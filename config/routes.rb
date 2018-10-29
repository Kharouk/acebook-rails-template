# frozen_string_literal: true

Rails.application.routes.draw do
  resources :image_posts
  devise_for :users
  root 'welcome_page#welcome'

  resources :welcome_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/delete', to: 'posts#delete'
  post 'posts/create', to: 'posts#create'
  get 'my_images', to:'image_posts#user_images'
  get 'my_posts', to: 'posts#user_posts'
  resources :posts do
    resources :comments
    resources :likes
  end
end
