class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :trackable

  validates :name, presence: true
  validates :contact, presence: true
  validates :address, presence: true

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
