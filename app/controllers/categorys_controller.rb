class CategorysController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def index
    @categorys = Category.all.order("id")
  end
  def new
    @category = Category.create
  end
  def create
    @category= Category.create(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end
  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end 
  end

  def destroy
    @category.destroy
    redirect_to :root
  end


  private
  def find_category
    @category = Category.find(params[:id]) 
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
