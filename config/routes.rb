Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  resources :posts do
    member do 
      get 'like'
      post :add_to_collection
    end
  end
  resources :categorys
  root 'posts#index'

  resources :accounts do 
    member do 
      delete :cancel_post
    end
  end

end
