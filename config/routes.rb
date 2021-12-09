Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users do
    get 'favorites' => 'favorites#index'
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :messages, only: [:create, :show]
  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  get 'users/:user_id/followings' => 'relationships#followings', as: 'followings'
  get 'users/:user_id/followers' => 'relationships#followers', as: 'followers'
  get 'tags/:tag_id/posts' => 'posts#search', as: 'tag_post'

end
