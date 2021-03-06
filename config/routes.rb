Rails.application.routes.draw do

  resources :meal_journals

  resources :meal_days

  resources :answers

  resources :questions

  resources :clients

  resources :messages
  resources :exercises
  resources :relationships, only: [:index, :create, :destroy]

  resources :specs do
    member do
      get :remove
    end
  end

  resources :programmes do
    member do
      get :change_status
    end
  end

  resources :profiles do
    member do
      get :promote
      get :downgrade
      get :unlock
      get :lock
      get :betrainer
      get :beclient
    end
  end

  devise_for :users

  resources :users do
    member do
      get :training
      get :enroll
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get '/review' => 'home#review'
  get '/search/query' => 'search#query'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
