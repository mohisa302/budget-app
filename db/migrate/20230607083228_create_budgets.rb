class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :amounts
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
