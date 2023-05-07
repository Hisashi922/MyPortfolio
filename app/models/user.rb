class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  validates :introduction, length: { maximum: 100 }

  has_many :projects, dependent: :destroy
  has_many :comments, through: :projects, dependent: :destroy
end
