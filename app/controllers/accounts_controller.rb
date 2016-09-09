class AccountsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.recent
    # @collection = Collection.last
    # @collection = Collection.find(params[:user_id])
  end

  def cancel_post
    @post = my_collection.post_collections.find_by_post_id(params[:id])
    @post.destroy
    redirect_to :back
  end
end
