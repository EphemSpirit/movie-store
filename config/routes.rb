Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :movies
      resources :directors, except: %i[edit update]
      resources :cast_members
      resources :castings, only: %i[new create destroy]

      get 'top_movies', to: 'movies#top_movies'
      get 'top_directors', to: 'directors#top_directors'
      get 'least_prolific', to: 'directors#least_prolific'
      get 'search', to: 'search#search'
    end
  end

end
