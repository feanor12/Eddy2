Eddy2::Application.routes.draw do
  match '/activate/:activation_code' , :to=> 'activations#create', :as=>'activate'
  match '/promote/:id' ,:to=>'users#promote',:as=>'promote'
  resources :lectures do
    resources :links
    resources :downloads do
      match 'download' => "downloads#download"
    end
    resources :announcements
  end
  resources :posts do
    resources :comments
  end
  resource :user_session
  resources :users, :mylinks
  resources :password_resets
  root :to=>"posts#index"
  #static routes
  resources :statics
  #match '/impressum' => 'static#impressum'
  #match '/agb' => 'static#agb'
end
