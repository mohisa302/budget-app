require 'rails_helper'

RSpec.describe 'Splash', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(email: 'test@example.com', password: 'password', name: 'Test User')
      visit root_path
    end

    it 'should have an href attribute in the "sign in" link' do
      expect(page).to have_selector('a[href]')
    end

    it 'shows the name of the app' do
      expect(page).to have_content('costino')
    end

    it 'should go to the register page' do
      find('a', text: 'sign in').click
      expect(page).to have_content('Log in')
    end

    it 'should go to the register page' do
      find('a', text: 'sign in').click
      expect(page).to have_content('Sign up')
    end
  end
end
