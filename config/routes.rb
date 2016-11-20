Rails.application.routes.draw do
  resources :users, only: [:create, :show, :destroy, :index, :update] do
    resources :businesses, only: [:create, :show, :destroy, :index, :update]
    collection do
      post '/login', to: 'users#login'
    end
  end



end
