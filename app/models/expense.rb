class Expense < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :categories, join_table: 'expense_categories'
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
