require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    before(:each) do
      @user = User.create(name: 'Mohi', email: 'mohi@gmail.com', password: 'password')
      @category = Category.create(name: 'Food', icon: '🍔', author_id: @user.id)
      @expense = Expense.new(name: 'Burger', amount: 10.0, category_id: @category.id)
    end

    it 'is not valid without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      @expense.amount = -10.0
      expect(@expense).to_not be_valid
    end

    it 'belongs to a category' do
      expect(@expense.category_id).to eq(@category.id)
    end
  end
end
