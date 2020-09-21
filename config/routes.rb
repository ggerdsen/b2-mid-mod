Rails.application.routes.draw do

  get "/flights", to: "flights#index"
  get "/airlines/:airline_id", to: "airlines#show"
end
