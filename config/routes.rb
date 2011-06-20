ShareYourStory::Application.routes.draw do
  get "essays/new"

  get "sessions/new"

  #get "users/new"
   resources :users
   resources :sessions,   :only => [:new, :create, :destroy]
   resources :microposts, :only => [:create, :destroy]
  
   resources :essays do
     #resources :pages 
     resources :rankings
   end
  


    get "users/new"

    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'
    match '/signout', :to => 'sessions#destroy'
    match '/contact', :to => 'pages#contact'
    match '/about',   :to => 'pages#about'
    match '/help',    :to => 'pages#help'
    match '/control', :to => 'pages#control'
    match '/bio', :to => 'pages#bio'
    match '/scoreindex1', :to => 'essays#scoreindex1'
    match '/scoreindex2', :to => 'essays#scoreindex2'
    match '/scoreindex3', :to => 'essays#scoreindex3'
    match '/scoreindex4', :to => 'essays#scoreindex4'
    match '/scoreindex5', :to => 'essays#scoreindex5'
    match '/scoreindex6', :to => 'essays#scoreindex6'
    match '/scoreindex7', :to => 'essays#scoreindex7'
    match '/scoreindex8', :to => 'essays#scoreindex8'
    match '/scoreindex9', :to => 'essays#scoreindex9'
    match '/scoreindex10', :to => 'essays#scoreindex10'
    root :to => 'pages#home'
    
    #root_path => '/'
    #root_url  => 'http://localhost:3000/'
    
    

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
