MyOwnSite::Application.routes.draw do

  #devise_for :admins

  devise_for :users, :path => "useraut", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  devise_for :admins, :path => 'admin', :controllers => { :sessions => "admin/sessions" }
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    match "/logout" => "devise/sessions#destroy"  
  end        
  devise_scope :admin do
    match "/logout" => "admin/sessions#destroy"  
  end
  
  root :to => 'Pages#index'

  match 'about' => 'Pages#about'
  match 'help' => 'Pages#help'
  match 'aboutSite' => 'Pages#about_site'
  match 'partners' => 'Pages#partners'
  match 'authors' => 'Pages#authors'
  match 'contacts' => 'Pages#contacts'
  match 'additionalInf' => 'Pages#additionalInf'   

  match 'africa' =>'Maps#africa' 
  match 'europa' =>'Maps#europa'
  
  match 'africa_country' => 'Maps#add_description_africa_country'      
  match 'africa_capital' => 'Maps#add_description_africa_capital'      

  resources :messages do
    collection do
      get 'message_status'
      get 'delete_message'
      get 'delete_messages'
      get 'delete_message_sent'
    end
  end

  match '/send', :to=> 'messages#send_m'
  match '/input', :to=> 'messages#input'
  match '/sent', :to=> 'messages#sent'  
  

  match 'about_me',  :to=> 'profiles#about_me'
  match 'my_page', :to=> 'profiles#my_page'
  match 'foto', :to=> 'profiles#foto'
  match 'friends', :to=> 'profiles#friends'
  match 'messages_friends', :to=> 'profiles#messages_friends'
  match 'my_settings', :to=> 'profiles#my_settings'
  match 'towns', :to=> 'profiles#towns'
  match 'messages_inbox', :to=> 'profiles#messages_inbox'
  match 'messages_sent', :to=> 'profiles#messages_sent'
  match 'messages_spam', :to=> 'profiles#messages_spam'
  match 'update_avatar', :to=> 'profiles#update_avatar'
  match 'send_message_in_profile', :to=> 'profiles#send_message_in_profile'

  
  namespace :admin do
    match '/' => 'dashboard#index', :as => 'root'

    resources :users do
      member do        
      end
    end    

    resource :messages do      
      member do  
        get 'inbox'       
        get 'sent'       
        get 'send_m'
        get 'delete_inbox_message'       
        get 'delete_sent_message'
      end
    end    
    


    resources :settings do
      member do
        
      end
    end    

    resources :add_places do
      member do
        
      end
    end    

    resource :my_informations do
      member do
        get 'foto'
        put 'update_avatar'
      end
    end    
  end


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
