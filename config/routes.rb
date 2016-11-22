Rails.application.routes.draw do
  resources :users, only: [:create, :show, :destroy, :index, :update] do
    resources :businesses, only: [:create, :destroy, :index]
    collection do
      post '/login', to: 'users#login'
      get '/dec', to: 'users#decode'
    end
  end
  resources :businesses, only: [:index, :update, :show] do
    collection do
      get '/all', to: 'businesses#all'
    end
  end

end
