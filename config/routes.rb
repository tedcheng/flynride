Flynride::Application.routes.draw do
<<<<<<< HEAD
  resources :users
=======

  get "geo_ranker/compute_distance"

  get "geo_ranker/rank_distances"

  post "sms_incoming/examine"

>>>>>>> 8cd14fdd42730b8f6b8cb3aaf5947bb93af1b097
  resources :riders
  resource :session, :only => [:new, :create]
  post "sessions/broadcast", to: "sessions#broadcast"
  post "sms_incoming/examine"
  
end
