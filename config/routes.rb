Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :directors, except: %i[edit update]

      get 'top_movies', to: 'movies#top_movies'
    end
  end
end
