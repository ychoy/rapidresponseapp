class User < ApplicationRecord
  has_secure_password
  validates :first_name, :email, presence: true
  validates :first_name, length: { in: 1..50 }
  validates :email, length: { in: 1..50 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :prefix, length: { in: 1..3 }
  validates :title, length: { in: 1..75 }
  validates :company, length: { in: 1..75 }
  validates :address, length: { in: 1..250 }
  validates :biography, length: { in: 10..500 }

end
