Rails.application.routes.draw do

  root to: "games#index"

  get '/login', to: 'sessions#login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/games/basketball', to: 'games#basketball'
  get '/games/football', to: 'games#football'
  get '/games/baseball', to: 'games#baseball'
  get '/games/soccer', to: 'games#soccer'
  #get '/users/tomorrow', to: 'users#tomorrow' 
  #get '/users/yesterday', to: 'users#yesterday' 

  resources :users, :games, :teams, :bets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
