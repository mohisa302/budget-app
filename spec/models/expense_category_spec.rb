require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  describe 'ExpenseCategory model' do
    before(:each) do
      @user = User.create(name: 'Mohi', email: 'mohi@gmail.com', password: 'password')
      @category = Category.create(name: 'Food', icon: '🍔', author_id: @user.id)
      @expense = Expense.create(name: 'Burger', amount: 10.0, category_id: @category.id)
      @expense_category = ExpenseCategory.new(expense_id: @expense.id, category_id: @category.id)
    end

    it 'is valid with an expense and category' do
      expect(@expense_category).to be_valid
    end

    it 'belongs to an expense' do
      expect(@expense_category.expense_id).to eq(@expense.id)
    end

    it 'belongs to a category' do
      expect(@expense_category.category_id).to eq(@category.id)
    end
  end
end
