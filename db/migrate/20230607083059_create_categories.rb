class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps null: false
    end
  end
end
