class Category < ApplicationRecord
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 255 }
  validates :icon, presence: true
end
