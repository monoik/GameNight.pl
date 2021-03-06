GameNightPl::Application.routes.draw do


  get "twitter/add_credentials"
  get "twitter/authenticated"

  get "twitter/send_tweet"
  match 'user_settings' => 'user_settings#edit'
  match 'unlink_twitter' => 'twitter#unlink'

  root :to => "dashboard#index"
  resources :users, :user_sessions, :user_settings, :friends, :invites, :gamenights, :gamenight_invitations, :games, :notifications

  match 'accept_invite' => 'invites#accept', :as => :accept_invite
  match 'send_invite' => 'friends#send_invite', :as => :send_invite
  match 'login' => 'user_sessions#new', :as => :login
  match 'friends' => 'friends#show', :as => :friends
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'end_friendship' => 'friends#end_friendship', :as => :end_friendship
  match 'my_gamenights' => 'gamenights#index', :as => :my_gamenights
  match 'invite_friends' => 'gamenight_invitations#invite_friends'
  match 'invite' => 'gamenight_invitations#invite'
  match 'gamenight_invitations/accept/:id' => 'gamenight_invitations#accept'
  match 'gamenight_invitations/reject/:id' => 'gamenight_invitations#reject'
  match 'new_gamenight' => 'gamenights#new', :as => :new_gamenight
  match 'dashboard' => 'dashboard#index', :as => :dashboard
  match 'user_settings_show' => 'user_settings#show'
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
