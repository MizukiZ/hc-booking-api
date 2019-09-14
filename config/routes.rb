Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
     # version 1 routing
      resources :options, only: [:index]
      resources :settings, only: [:index, :update]
      resources :clients, only: [:index, :create, :update, :destroy]
      resources :appointments, only: [:index, :create, :update, :destroy]
      resources :payments, only: [:create]

      # authentication routes
      scope :authentication, :controller => 'authentication' do
        post 'login', to: 'authentication#login'
      end
    end
  end
end
