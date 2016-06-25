Bolao::Application.routes.draw do
  root to: 'dashboard#index'
  
  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  #resources :contests, path_names: { new: 'new/:id' }
  
  get  'contests/:id',          to: 'contests#show',        as: :contest
  get  'contests/new/:id',      to: 'contests#new',         as: :new_contest
  get  'contests/:id/edit',     to: 'contests#edit',        as: :edit_contest

  get  'matches/:id',           to: 'matches#index',        as: :contest_matches
  
  get  '/palpites/:id',         to: 'guesses#my_guesses',   as: :my_guesses
  post '/palpites/:id',         to: 'guesses#update',       as: :my_guesses_form

  get  '/meu-historico',  to: 'users#history',      as: :my_history
  get  '/perfil/:id',     to: 'users#profile',      as: :user_profile

  get  '/jogo/:id',       to: 'matches#show',       as: :match_details

  get  '/regras', to: 'rules#index', as: :rules
end