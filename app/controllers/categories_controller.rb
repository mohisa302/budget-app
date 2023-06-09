class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id)
    @total_amount = @categories.joins(:expenses).sum(:amount)
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
    other_category = Category.where.not(id: @category.id).first # choose another valid category to assign expenses to
    
    Expense.where(category_id: @category.id).update_all(category_id: other_category&.id) # assigns the expenses to the other category
    @category.destroy
    redirect_to categories_path
  end

  def total_amount_for_category(category)
    category.expenses.sum(:amount)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
