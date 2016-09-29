class AccountsController < ApplicationController

  def index
    @user = current_user
    # @posts = @user.posts.recent.paginate(page: params[:page], per_page: 5)
    # @my_collection = my_collection.posts.paginate(page: params[:page], per_page: 1)
  end

  def my_posts
    @user = current_user
    @posts = @user.posts.recent.paginate(page: params[:page], per_page: 5)
    respond_to do |f|
      f.html
      f.js {@posts}
    end
  end

  def show
  end

  def my_collections
    @my_collections = my_collection.posts.paginate(page: params[:page], per_page: 1)
    respond_to do |f|
      f.html
      f.js {@my_collections}
    end
  end

  def cancel_post
    @post = my_collection.post_collections.find_by_post_id(params[:id])
    post_title = Post.find(params[:id]).title
    @post.destroy
    redirect_to :back
    flash[:notice] = "#{I18n.t("controllers.accounts.cancel_post")} #{post_title}"
  end
end
