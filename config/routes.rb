Rails.application.routes.draw do
  resources :tickets, only: [:index, :create, :update]
end
