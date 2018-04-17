Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :attractions do
    resources :reviews
  end
  root 'attractions#index'
end
