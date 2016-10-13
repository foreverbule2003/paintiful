Rails.application.routes.draw do
  devise_for :users, controllers: {
    session: "users/session",
    confirmations: "users/confirmations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  # devise_for controllers: {  }
  resources :posts do
    resources :tools 
    member do 
      get 'like'
      post :add_to_collection
    end
    collection do
      post :set_locale
    end

  end
  resources :categorys
  root 'posts#index'

  resources :accounts do 
    collection do 
      get :my_posts
      get :my_collections
    end
    member do 
      delete :cancel_post
    end
  end
  # get 'accounts/my_posts' => 'accounts#my_posts'
  # get 'accounts/' => 'accounts#my_collections'

end
