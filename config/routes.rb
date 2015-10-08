Rails.application.routes.draw do
  
  devise_for :users
  root 'pages#index'
  
  resources :libraries
  resources :categories
  resources :sections
  resources :invitations do
		member do
			get "accept", to: "invitations#accept"
		end
	end
  
  resources :entries do
    member do
      put "like", to: "entries#upvote"
      put "dislike", to: "entries#downvote"
      put "read", to: "entries#read"
      put "accept", to: "entries#accept"
    end
  end


  put 'toggle_edit' => 'toggles#toggle_edit', as: :toggle_edit
  put 'toggle_read' => 'toggles#toggle_read', as: :toggle_read


  #get '/sug' => 'entries#index', as: :entry_index
  get '/sug' => 'libraries#approve', as: :suggestion_index
  get '/entry/suggest' => 'entries#suggest', as: :suggest_entry

  get '/tag/:id'  => 'tags#show', as: :tag
  get '/tags' => 'tags#index', as: :tag_search
  
  #get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
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
