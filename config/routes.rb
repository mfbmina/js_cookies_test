Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'reports#index'

  # Example of regular route:
  get 'reports' => 'reports#index'

  namespace :api, constraints: { format: 'json' } do
    resources :cookies, only: :create
  end
end
