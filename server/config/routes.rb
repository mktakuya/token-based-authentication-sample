Rails.application.routes.draw do
  resources :courses, only: [ :show, :index, :create, :update ]

  post '/users/sign_in', to: 'users#sign_in'
end
