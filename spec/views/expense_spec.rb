require 'rails_helper'
RSpec.describe 'Category', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index page' do
     before(:each) do
      @user = User.create(name: 'Kolly', email: 'asdasa@gmail.com', password: 'password', confirmed_at: Time.now)
      @category = Category.create!(name: 'Groceries', author: @user, icon:"https://unsplash.com/photos/F_-0BxGuVvo")
      @expense = Expense.create!(name:"Test1", category: @category, amount: 7)
      sign_in @user
      visit category_expenses_path(@category)
     end

    it 'shows correct category expense' do
      expect(page).to have_content(@category.name)
    end

    it 'shows the navbar correctly' do
      expect(page).to have_content('Expenses for')
    end

    it 'shows add button correctly ' do
      expect(page).to have_content("Add a new Expense")
    end
  end
end
