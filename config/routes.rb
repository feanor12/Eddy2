Eddy2::Application.routes.draw do
  match '/activate/:activation_code' , :to=> 'activations#create', :as=>'activate'
  resources :lectures do
    resources :downloads do
      resources :links
    end
    resources :announcements
  end
  resources :posts do
    resources :comments
  end
  resource :user_session
  resources :users, :mylinks
  root :to=>"posts#index"
  #static routes
  match '/impressum' => 'static#impressum'
  match '/agb' => 'static#agb'
end
