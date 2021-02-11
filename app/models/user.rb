class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes, dependent: :destroy
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :first_name,
  presence: true

  validates :last_name,
  presence: true

  validates :age,
  presence: true,
  numericality: {only_integer: true, greater_than: 0}

  validates :description, 
  presence: true

end
