class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # class methods and attributes here
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  has_many :budgets
  has_many :categories

  validates :name, presence: true, length: { maximum: 255 }
end
