require 'rails_helper'
RSpec.describe 'Expense', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
      @category = Category.create(name: 'Groceries', author: @user, icon: 'https://unsplash.com/photos/F_-0BxGuVvo')
      sign_in @user
      visit categories_path
    end

    it 'logs in and displays Sign out button' do
      expect(page).to have_content('Sign out')
    end

    it 'shows the navbar correctly' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'shows the Category name' do
      expect(page).to have_content(@category.name)
    end

    it 'shows the Category icon' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'shows total amount correctly ' do
      expect(page).to have_content('0.0 $')
    end
  end
end
