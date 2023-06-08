class ExpenseCategory < ApplicationRecord
  belongs_to :expense, class_name: 'Expense'
  belongs_to :category, class_name: 'Category'
end
