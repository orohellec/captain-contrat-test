Rails.application.routes.draw do
  root to: 'pages#home'
  get '/fights-history', to: 'pages#fights_history'
  resources :fighters
  post '/', to: "fighters#fight_arena", as: :fight
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
