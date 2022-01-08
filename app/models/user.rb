class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable

  validates :name, presence: true
  validates :contact, presence: true
  validates :address, presence: true
end
