Rails.application.routes.draw do
  devise_for :users
  root :to => 'companies#index'
  resources :accept_conditions, :except => [:show]
  resources :events
  resources :companies do
    resources :checks, :except => [:show]
  end
  resources :datas, :only => [:index]
  resources :screening_process, :only => [:index]
  resources :first_interviews, :only => [:index]
  resources :second_interviews, :only => [:index]
  resources :third_interviews, :only => [:index]
  resources :last_interviews, :only => [:index]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
