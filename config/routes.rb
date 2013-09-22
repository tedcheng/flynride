Flynride::Application.routes.draw do

  post "sms_incoming/examine"

  resources :riders
  
end
