Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :movies do
        get '/find_all', to: 'search#index'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      get '/', to: 'movies#index'
      resources :movies, only: [:index, :show]
    end
  end
end
