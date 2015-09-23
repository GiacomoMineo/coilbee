Rails.application.routes.draw do
  
  devise_for :users
  root 'pages#index'
  get '/libaries/index' => 'libraries#index', as: :library_index
  get '/library/:id' => 'libraries#show', as: :library
  get '/libraries/new' => 'libraries#new', as: :new_library
  post '/libraries' => 'libraries#create'
  delete '/library/:id' => 'libraries#delete', as: :delete_library
  get '/libraries/:id' => 'libraries#edit', as: :library_edit_path
  patch '/library/:id' => 'libraries#update', as: :library_update_path

  get '/categories/index' => 'categories#index' #to be replaced
  get '/categories/new' => 'categories#new'
  post '/categories' => 'categories#create'
  get '/categories/:id' => 'categories#edit', as: :category_edit_path
  patch '/category/:id' => 'categories#update', as: :category_update_path
  
  get '/section/:id' => 'sections#show', as: :section
  get '/sections/new' => 'sections#new'
  post '/sections' => 'sections#create'
  
  get '/entries' => 'entries#index'
  get '/entries/new' => 'entries#new'
  post '/entries' => 'entries#create'
  
  get '/tag/:id'  => 'tags#show', as: :tag
  get '/tags' => 'tags#index', as: :tag_search
  
  #get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :categories
  resources :users
  resources :libraries
  resources :entries do
    member do
      put "like", to: "entries#upvote"
      put "dislike", to: "entries#downvote"
      put "read", to: "entries#read"
    end
  end
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
