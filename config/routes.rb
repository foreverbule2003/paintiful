Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users, controllers: {
    session: "users/session",
    confirmations: "users/confirmations"
  }
  resources :posts do
    member do 
      get 'like'
      post :add_to_collection
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
