class PostsController < ApplicationController
  include ApplicationHelper

  before_action :find_post, only: [:edit, :show, :update, :destroy, :like, :add_to_collection]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]

  def index
    @posts= Post.all.recent
  end

  def new
    @post= current_user.posts.build
  end
  def create
    @post= current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
      flash[:notice] = I18n.t("controllers.posts.create")
    else
      render :new
    end
  end

  def show
    @random_post = @post.random_post
    @other_random_post = @post.other_random_post(@random_post)
    @post.do_view
  end

  def edit
    unless is_author?(@post)
      redirect_to post_path(@post)
      flash[:alert] = I18n.t("controllers.posts.edit.you_are_not_author")
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = I18n.t("controllers.posts.update")      
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
    flash[:alert] = I18n.t("controllers.posts.destroy")
  end

  def like
    unless current_user.voted_for? @post 
      @post.liked_by current_user
      flash[:notice] = "You give #{@post.title} a like :)"
    else 
      @post.unliked_by current_user
    end
    redirect_to :back
  end

  def add_to_collection
    unless my_collection.posts.include?(@post)
      my_collection.add_post_to_collection(@post)   
      flash[:notice] = I18n.t("controllers.posts.add_to_collection.success")
    else
      flash[:warning] = I18n.t("controllers.posts.add_to_collection.fail")
    end
    redirect_to :back
  end

  def set_locale
    I18n.default_locale = (params[:locale])
    redirect_to :back
  end

  def search
    @posts = Post.search params[:search], limit: 1000
    render 'search' 
  end

  private
  def find_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :category_id, 
                                  tools_attributes: [:id, :name, :_destroy],
                                  steps_attributes: [:id, :description, :_destroy] )
  end
end
