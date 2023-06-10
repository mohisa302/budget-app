require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    before(:each) do
      @user = User.create(name: 'Mohi', email: 'mohi@gmail.com', password: 'password')
      @category = Category.new(name: 'Food', icon: '🍔', author_id: @user.id)
    end

    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is not valid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'belongs to an author (user)' do
      expect(@category.author_id).to eq(@user.id)
    end
  end
end
