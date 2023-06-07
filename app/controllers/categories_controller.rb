class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def new
    @user = current_user
    @category = Category.new
  end
  
  def create
    @user = current_user
    print "paramets"
    @category = Category.new(category_params.merge(author_id: current_user.id))
  
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  
  
  private
  
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
