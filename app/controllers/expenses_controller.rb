class ExpensesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
    @total_amount = @expenses.sum(:amount)
  end
end
