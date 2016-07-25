class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :show, :update, :destroy, :like]
  def index
    @posts= Post.all.order("created_at DESC")
  end

  def new
    # byebug
    @post= current_user.posts.build
  end

  def create
    @post= current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
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
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def like
    @post.do_like
    redirect_to :back
    byebug
  end


  private
  def find_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :category_id)
  end
end
