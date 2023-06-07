class CreateBudgetCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_categories do |t|
      t.references :budget, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
