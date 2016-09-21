class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :show, :update, :destroy, :like]
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
      flash[:notice] = "Post created success"
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
      flash[:notice] = "Post updated success"      
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
    flash[:danger] = "Post has been deleted"
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
      flash[:notice] = "Add to my collection success"
    else
      flash[:warning] = "This post alreay in collection"   
    end
    redirect_to :back
  end

  private
  def find_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :category_id)
  end
end
