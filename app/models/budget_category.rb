class BudgetCategory < ApplicationRecord
  belongs_to :budget, class_name: 'Budget'
  belongs_to :category, class_name: 'Category'
end
