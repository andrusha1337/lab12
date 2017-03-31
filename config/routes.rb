Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'
  get 'input' => 'lab8#input'
  get 'output' => 'lab8#output'
  root 'home#index'
  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
