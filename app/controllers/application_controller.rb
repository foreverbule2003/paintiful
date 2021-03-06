class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :go_back
  before_action :user_strong_parameter, if: :devise_controller?



  def go_back
    redirect_to :back
  end
  helper_method :my_collection

  def my_collection
    @my_collection ||= find_my_collection  
  end

  def find_my_collection
    my_collection = Collection.find_by_id(session[:collection_id])

    if !my_collection.present?
      my_collection = Collection.create
    end

    session[:collection_id] = my_collection.id
    my_collection
  end

  protected
  def user_strong_parameter
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit( :email, :name, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit( :email, :name, :password, :password_confirmation, :current_password)
    end


  end
end
