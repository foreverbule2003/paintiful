class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :show, :update, :destroy, :like]
  before_action :authneticate_user, only: [:new, :create, :edit, :update,:destroy]
  def index
    @posts= Post.all.order("created_at DESC")
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
    flash[:danger] = I18n.t("controllers.posts.destroy")
  end

  def like
    @post.do_like
    redirect_to :back
    # go_back
  end

  def add_to_collection
    @post = Post.find(params[:id])
    if !my_collection.posts.include?(@post)
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
