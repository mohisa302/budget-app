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
    @category = Category.new(category_params.merge(author_id: current_user.id))
  
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to user_categories_path(current_user)
  end

  def total_amount_for_category(category)
    category.expenses.sum(:amount)
  end
end
