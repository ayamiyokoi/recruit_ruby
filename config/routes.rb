Rails.application.routes.draw do
  resources :checks
  resources :accept_conditions
  resources :events
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end