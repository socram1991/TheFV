Rails.application.routes.draw do
  devise_for :users
  resources :attractions do
    resources :reviews
  end
  root 'attractions#index'
end
