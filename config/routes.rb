Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/game-rules', to: 'pages#game_rules', as: :game_rules
  get '/fighter-history', to: 'pages#fighter_history', as: :fighter_history
  get '/fighters-ranking', to: 'pages#fighters_ranking', as: :fighters_ranking
  get '/fight-result/:id', to: 'pages#fight_result', as: :fight_result
  post '/', to: "fighters#fight", as: :fight
  resources :fighters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
