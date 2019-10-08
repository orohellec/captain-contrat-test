Rails.application.routes.draw do
  root to: 'pages#home'
  resources :fighters
  post '/', to: "fighters#fight_arena", as: :fight
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
