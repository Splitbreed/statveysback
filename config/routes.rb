Rails.application.routes.draw do
  resources :users, only: [:create, :show, :destroy, :index, :update] do
    collection do
      post '/login', to: 'users#login'
    end
  end

  resources :businesses, only: [:create, :show, :destroy, :index, :update]
end
