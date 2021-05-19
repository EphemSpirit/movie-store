Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users
      #for the love of god clean this up
      
      resources :movies do
        resources :comments, module: :movies
      end
      resources :comments, module: :comments

      resources :directors, except: %i[edit update]
      resources :cast_members
      resources :castings, only: %i[new create destroy]

      get 'users', to: 'users#index'
      get 'user/:id', to: 'users#show'

      get 'top_movies', to: 'movies#top_movies'
      get 'top_directors', to: 'directors#top_directors'
      get 'least_prolific', to: 'directors#least_prolific'
      get 'search', to: 'search#search'
    end
  end

end
