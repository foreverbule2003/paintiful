class AccountsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.recent
  end
end
