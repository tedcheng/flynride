Flynride::Application.routes.draw do
  resources :users

  post "pairings/create"

  get "pairings/destroy"

  get "geo_ranker/compute_distance"

  get "geo_ranker/rank_distances"

  post "sms_incoming/examine"

  resources :riders
  resource :session, :only => [:new, :create]
  post "sessions/broadcast", to: "sessions#broadcast"
  
end
