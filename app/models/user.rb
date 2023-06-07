class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # class methods and attributes here
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
end
