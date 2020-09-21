Rails.application.routes.draw do

  get "/flights", to: "flights#index"
  get "/airlines/:airline_id", to: "airlines#show"
  delete "/flights/:flight_id/passengers/:passenger_id", to: "flights#update"
  get "/passengers", to: "passengers#index"
end
