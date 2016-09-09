class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :go_back
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
end
