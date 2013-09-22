Flynride::Application.routes.draw do

  post "pairings/create"

  get "pairings/destroy"

  get "geo_ranker/compute_distance"

  get "geo_ranker/rank_distances"

  post "sms_incoming/examine"

  resources :riders
  
end
