Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users do
    get 'favorites' => 'favorites#index'
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
end
