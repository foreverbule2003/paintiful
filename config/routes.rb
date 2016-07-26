Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  resources :posts do
    member do 
      get 'like'
    end
  end
  resources :categorys
  root 'posts#index'

end
