Rails.application.routes.draw do
  
  resources :users do
    resources :relationships
  end
  resources :posts do
    resources :comments
  end
 

  # Home Routes

  root 'home#index'

  get '/home' => 'home#home'

  get '/globalcaws' => 'home#globalcaws'
  
  # Sessions Routes

  post '/log-in' => 'sessions#create'

  get '/sign-out' => 'sessions#destroy'

  # Post Routes

  get 'posts/create' => 'posts#create'

  get 'posts/show' => 'user#show'

  get 'posts/update'

  delete 'posts/:id' => 'posts#destroy'

  # Users Routes

  get '/users/:id' => 'users#show'

  get '/users' => 'users#index'

  get 'users/new' => 'users#new'

  get 'users/create'

  get 'users/edit'


  # Relationship Routes

  post '/users/:user_id/relationships' => 'relationships#create'

  delete '/users/:user_id/relationships/:id' => 'relationships#destroy'

  # Profile Routes

  put '/profiles/:id/update' => 'profiles#update', as: :profile_update

  post '/deleteself' => 'users#destroy'

  # Comment Routes

  post '/posts/:post_id/comments' => 'comments#create'

  get 'comments/edit'

  get '/posts/:post_id/comments/:id' => 'comments#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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