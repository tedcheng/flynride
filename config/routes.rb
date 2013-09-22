Flynride::Application.routes.draw do
  resources :users
  resources :riders
  resource :session, :only => [:new, :create]
  post "sessions/broadcast", to: "sessions#broadcast"
  post "sms_incoming/examine"
  
end
