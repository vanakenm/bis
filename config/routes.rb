Rails.application.routes.draw do
  resources :requests
  post 'calls/voice'
  post 'calls/record'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
