class CategorysController < ApplicationController
  def index
    @categorys = Category.all.order("id")
  end
  def show
    @category = Category.find(params[:id])
  end
end
