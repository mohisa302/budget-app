class Category < ApplicationRecord
  has_many :transactions
  has_many :expenses
  has_many :budget_categories, class_name: 'BudgetCategory', foreign_key: 'category_id', dependent: :destroy
  has_many :budgets, through: :budget_categories
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 255 }
  validates :icon, presence: true
end
