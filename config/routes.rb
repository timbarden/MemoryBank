Rails.application.routes.draw do
  resources :entries
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
