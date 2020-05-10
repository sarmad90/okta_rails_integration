Rails.application.routes.draw do
  get 'home/index'
  get 'oauth/okta_callback'
  get 'oauth/authenticate_okta'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
