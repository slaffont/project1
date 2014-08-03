Rails.application.routes.draw do
  devise_for :users
  # resources :photos
  # resources :games

  root "games#index"

  resources :games
  # get "/games" => "games#index"
  # get "/games/:id" => "games#show"
  # get "/games/result" => "games#result"

end


