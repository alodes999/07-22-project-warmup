Rails.application.routes.draw do

  get "/" => "users#login"

  get "/dashboard" => "tasks#index", :as => 'dashboard'

  get "/edit_profile" => "users#edit", :as => 'edit_profile'

  get "/new_task" => "tasks#new", :as => "new_user_task"

  get "/tasks/:id" => "tasks#show", :as => "user_task"

  get "/tasks/:id/edit" => "tasks#edit", :as => "edit_user_task"

  get "/login" => "users#login", :as => 'login'

  post "/authenticate_login" => "users#authenticate_login", :as => 'authenticate'

  get "/users" => "users#index", :as => 'users'

  get "/users/new" => "users#new", :as => 'new_user'

  post "/users" => "users#create"

  get "/users/:id/edit" => "users#edit", :as => 'edit_user'

  put "/users/:id" => "users#update"

  delete "/users/:id" => "users#destroy"

  get "/users/:user_id/tasks" => "tasks#index", :as => 'tasks'

  get "/users/:user_id/tasks/new" => "tasks#new", :as => "new_task"

  post "/users/:user_id/tasks" => "tasks#create"

  get "/users/:user_id/tasks/:id" => "tasks#show", :as => "task"

  get "/users/:user_id/tasks/:id/edit" => "tasks#edit", :as => "edit_task"

  put "/users/:user_id/tasks/:id" => "tasks#update"

  delete "/users/:user_id/tasks/:id" => "tasks#destroy"

  get "/users/:id" => "users#show", :as => "user"






  # TODO  Add sessions[:email] to header for layout









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
