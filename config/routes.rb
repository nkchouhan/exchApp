ExchApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => 'registrations' }
  
  get 'home/dashboard' => 'home#dashboard'
  resources :withdrawls, :only => [:index, :new, :create] do
    member do
      get 'confirm'
    end
    collection do
      get 'deposit'
    end
	end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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
  namespace :admin do
    resources :stats_bars
    resources :account_histories
    resources :orders
    get 'home/dashboard' => 'home#dashboard'
    get 'home/btc' => 'home#btc'
    get 'home/ltc' => 'home#ltc'
    get 'home/doge' => 'home#doge'
    get 'home/gcs' => 'home#gcs'
    get 'home/role_type' => 'home#role_type'
    get 'home/assign_role' => 'home#assign_role'
  end
  
end
