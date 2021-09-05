Rails.application.routes.draw do
  get 'datas/index'
  devise_for :users
  root :to => 'companies#index'
  resources :accept_conditions, :except => [:show]
  resources :events
  resources :companies do
    resources :checks, :except => [:show]
  end
  resources :datas, :only => [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
