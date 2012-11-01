MyOwnSite::Application.routes.draw do

  #devise_for :admins

  devise_for :users, :path => "useraut", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  devise_for :admins, :path => 'admin', :controllers => { :sessions => "admin/sessions" }
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    match "/logout" => "sessions#destroy"  
  end        
  devise_scope :admin do
    match "/logout" => "admin/sessions#destroy"  
  end
  
  #Root 
  root :to => 'pages#index'

  #Pages Controller
  match 'about' => 'pages#about'
  match 'help' => 'pages#help'
  match 'aboutSite' => 'pages#about_site'
  match 'partners' => 'pages#partners'
  match 'authors' => 'pages#authors'
  match 'contacts' => 'pages#contacts'
  match 'search' => 'pages#search'
  match 'additionalInf' => 'pages#additionalInf'  

  resources :pages do
    collection do
      get 'status_active'
    end
  end

  #Maps Controller  
  
  match 'map_view/:name' =>'maps#map_view', :as => 'map_view'
  match 'country/:country_name' =>'maps#country', :as => 'country'
  match 'capital/:capital_name' =>'maps#capital', :as => 'capital'
  match 'city/:city_name' =>'maps#city', :as => 'city'

  
  match 'about_country' => 'maps#about_country'      
  match 'about_capital' => 'maps#about_capital'
  match 'world_cities' => 'maps#add_description_city'
  match 'about_city' => 'maps#about_city'

  match 'download_hymn/:id' => 'maps#download_hymn'      
  #Messages Controller
  resources :messages do
    collection do
      get 'message_status'
      get 'delete_message'      
      get 'delete_message_sent'
      get 'delete_group_messages'
      get 'delete_group_messages_sent'    
    end
  end

  match '/send', :to=> 'messages#send_m'
  match '/input', :to=> 'messages#input'
  match '/sent', :to=> 'messages#sent'
  
  
  #Routes profiles controller
  
  resources :profiles   
  #match "my_page/:id" => 'profiles#my_page'
  
  match 'foto', :to=> 'profiles#foto'   
  match 'my_settings', :to=> 'profiles#my_settings'
  match 'towns', :to=> 'profiles#towns'
    
    #Messages
    match 'messages_inbox', :to=> 'profiles#messages_inbox'
    match 'messages_sent', :to=> 'profiles#messages_sent'
    match 'messages_spam', :to=> 'profiles#messages_spam'  
    match 'send_message_in_profile', :to=> 'profiles#send_message_in_profile'
    
    #Foto
    match 'update_avatar', :to=> 'profiles#update_avatar'
    match 'avatar', :to=> 'profiles#foto_avatar'   
    match 'albums', :to=> 'profiles#foto_albums'   

    #About me
    match 'my_information',  :to=> 'profiles#my_information'
    match 'my_contacts',  :to=> 'profiles#my_contacts'
    match 'interests',  :to=> 'profiles#interests'
      match 'secondary_education',  :to=> 'profiles#secondary_education'
      match 'higher_education',  :to=> 'profiles#higher_education'
      match 'courses',  :to=> 'profiles#courses'
      match 'trainings',  :to=> 'profiles#trainings'
    match 'career',  :to=> 'profiles#career'
    match 'life_position',  :to=> 'profiles#life_position'
    match 'update_my_information', :to=> 'profiles#update_my_information'
    match 'update_my_contacts', :to=> 'profiles#update_my_contacts'
    match 'update_my_interests', :to=> 'profiles#update_my_interests'
    match 'update_secondary_education', :to=> 'profiles#update_secondary_education'
    match 'update_higher_education', :to=> 'profiles#update_higher_education'
    match 'update_course', :to=> 'profiles#update_course'
    match 'update_trainings',  :to=> 'profiles#update_training'
    match 'update_career',  :to=> 'profiles#update_career'

    #Friends 
    match 'query_to_add_friend', :to=> 'profiles#query_to_add_friend' 
    match 'delete_friend', :to=> 'profiles#delete_friend'
    match 'delete_friend_query_to', :to=> 'profiles#delete_friend_query_to'
    match 'add_friend', :to=> 'profiles#add_friend' 

    match 'friends_online', :to=> 'profiles#friends_online' 
    match 'friends_all', :to=> 'profiles#friends_all' 
    match 'friends_query_to', :to=> 'profiles#friends_query_to' 
    match 'friends_query_in', :to=> 'profiles#friends_query_in' 

    
    

  
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

    resource :add_places do
      member do
        get 'index'
        post 'attachment_data'        
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
