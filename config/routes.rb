Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
     # version 1 routing
      resources :options, only: [:index]
      resources :settings, only: [:index]
      resources :clients, only: [:index, :create, :update, :destroy]
      resources :appointments, only: [:index, :create, :update, :destroy]
      resources :payments, only: [:create]
    end
  end
end
