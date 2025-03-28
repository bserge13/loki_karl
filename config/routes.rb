Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # landing page
  get '/', to: 'welcome#index', as: 'home'

  # dogs
  # get '/dogs', to: 'dogs#index'
  # get '/dogs/:id', to: 'dogs#show'
  resources :dogs, only: [:index, :show, :create, :edit, :update, :destroy]

  # cats
  # get '/cats', to: 'cats#index'
  # get '/cats/:id', to: 'cats#show'
  resources :cats, only: [:index, :show, :create, :edit, :update, :destroy]

  # cat_families
  get '/families/cats/:cat_id', to: 'families#index', as: 'families_cats'

  # dog_families
  get '/families/dogs/:dog_id', to: 'families#index', as: 'families_dogs'

  # familes
  get '/families/new', to: 'families#new', as: 'new_families'
  post '/families', to: 'families#create', as: 'create_families'
  get '/families', to: 'families#index', as: 'all_families'
  get '/families/:id', to: 'families#show', as: 'family'
  delete '/families/:id', to: 'families#destroy'
end
