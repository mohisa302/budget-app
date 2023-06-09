class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
    @total_expense = @expenses.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.new(expense_params)
  
    # set the category for the new expense
    @expense.category = @category
  
    # assign an array of category ids to the expense object
    @expense.category_ids = params[:expense][:category_ids]
  
    if @expense.save
      redirect_to category_expenses_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.find(params[:id])
    
    # Remove the expense from the categories association
    @expense.categories.delete(@category)
    
    # Destroy the expense record if it's not associated with any other categories
    @expense.destroy if @expense.categories.empty?
    
    redirect_to category_expenses_path(@category)
  end
  
  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id, category_ids: [])
  end
end
