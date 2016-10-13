Rails.application.routes.draw do
  devise_for :users, controllers: {
    session: "users/session",
    confirmations: "users/confirmations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
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

end
