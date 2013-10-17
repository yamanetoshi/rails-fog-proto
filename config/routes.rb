Shurijp::Application.routes.draw do

#  get "vmresavation/index"
#  get "vmresavation/new"
#  get "vmresavation/create"
#  get "vmresavation/edit"
#  get "vmresavation/update"
#  get "vmresavation/destroy"

  resources :vmresavation, only: [:new, :create, :edit, :update, :destroy]
  match 'vmresavation/:id', :to => 'vmresavation#index', :as => 'vmresavation', :via => :get

  resources :resavations, only: [:index, :show]
#  resources :resavations, :expect => [:index]
#  resources :resavations, :path => 'vm/resavations', only: [:create, :new, :edit, :show, :update, :destroy]
#  resources :resavations, only: [:create, :new, :edit, :show, :update, :destroy]
#  match 'resavations/vm/:id/', :to => 'resavations#index', :as => 'resavations', :via => :get

  get "user_property/index"

  resources :providers


  root :to => "conns#index"

  namespace :api do
    devise_for(:users, :controllers => { :sessions => "sessions" })
  end

  devise_for :users
  get 'conns', :to => 'conns#index', :as => :user_root

  resources :conns
  resources :vm_operations, only: [ :new, :create ] do
    member do
      get :start, :stop, :reboot
    end
  end

  match 'vm_operations/:idx', :to => 'vm_operations#index', :as => 'vm_operations', :via => :get

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
