TinamiViewer::Application.routes.draw do
  root :to => "index#index", as: :index

  controller :index do
    get  "auth",    as: :login
    post "auth",    as: :auth
    get  "logout",  as: :logout
    get  "search",  as: :search
  end

  get "ranking/:category" => "index#ranking", as: :ranking

  get    "content/:cont_id"                      => "index#content",       as: :content
  get    "content/:cont_id/comments"             => "user#comments",       as: :comments
  post   "content/:cont_id/comments"             => "user#add_comment",    as: :add_comment
  delete "content/:cont_id/comments/:comment_id" => "user#remove_comment", as: :remove_comment

  get  "watchkeyword/contents"                 => "user#watchkeyword_contents", as: :watchkeyword_contents
  get  "friend/recommend/contents"             => "user#friend_recommends",     as: :friend_recommends
  get  "collections"                           => "user#collections",           as: :collections
  post "collections/:cont_id"                  => "user#add_collection",        as: :add_collection
  get  "bookmarks/contents"                    => "user#bookmark_contents",     as: :bookmark_contents
  get  "bookmarks"                             => "user#bookmarks",             as: :bookmarks
  post "bookmarks/:prof_id(/content/:cont_id)" => "user#add_bookmark",          as: :add_bookmark
  post "support/:cont_id"                      => "user#support",               as: :support

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
  # match ':controller(/:action(/:id(.:format)))'
end
