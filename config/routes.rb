Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :jokes
  resources :foods
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  #API

  #API
  namespace :api, defaults: { format: 'json' } do
    scope '/v1/', module: :v1 do
      resources :jokes do
        get 'index'
        get 'random', on: :collection
      end
      resources :foods do
        get 'index'
        get 'random', on: :collection
      end
    end
  end
end
