Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # landing page
  get '/', to: 'welcome#index'

  # dogs
  get '/dogs', to: 'dogs#index'

  # cats
  get '/cats', to: 'cats#index'
  get '/cats/:id', to: 'cats#show'

  # cat_families
  get '/families/cats/:cat_id', to: 'families#index'

  # dog_families
  get '/families/dogs/:dog_id', to: 'families#index'
end
