class CreateJoinTableCategoryExpense < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories do |t|
      t.references :expense, null: false, foreign_key: { on_delete: :cascade }
      t.references :category, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
    
  end
end
