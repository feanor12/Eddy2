Eddy2::Application.routes.draw do
  resources :static_links,:except=>[:show]
  get 'static_link/:id/up' ,:to=>'static_links#up'
  get 'static_link/:id/down' ,:to=>'static_links#down'

  get 'static_site/:id/up' ,:to=>'statics#up'
  get 'static_site/:id/down' ,:to=>'statics#down'
  
  post 'apply/:group_id',:to=>'group_applications#create',:as=>'apply'

  match '/rss/news_rss.html' ,:to=>redirect("/posts.rss")

  match '/activate/:activation_code' , :to=> 'activations#create', :as=>'activate'
  match '/promote/:id' ,:to=>'users#promote',:as=>'promote'
  match 'mods', :to=>'users#index_mods',:as=>'mods'


  resources :lectures do
    match 'parse' => "lectures#parse", :as =>'parse'
    resources :groups do
      resources :timers
    end
    resources :links
    resources :downloads do
      match 'download' => "downloads#download"
    end
    resources :announcements do
      resources :comments
    end
  end
  resources :posts do
    resources :comments
  end

  resource :user_session
  resources :users, :mylinks
  resource :password_resets
  root :to=>"posts#index"
  #static routes
  resources :statics
  #match '/impressum' => 'static#impressum'
  #match '/agb' => 'static#agb'
end
