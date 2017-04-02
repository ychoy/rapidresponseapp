class User < ApplicationRecord
  has_secure_password
  has_many :expertises
  has_many :messages
  has_many :conversations, through: :messages
  
  validates :username, uniqueness: true, allow_nil: true
  validates :first_name, :email, presence: true
  validates :first_name, length: { in: 1..50 }
  validates :email, length: { in: 1..50 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :prefix, length: { in: 1..3 }, allow_nil: true
  validates :title, length: { in: 1..75 }, allow_nil: true
  validates :company, length: { in: 1..75 }, allow_nil: true
  validates :address, length: { in: 1..250 }, allow_nil: true
  validates :biography, length: { in: 10..500 }, allow_nil: true

	def member?(conversation)
    conversation.users.include?(self)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
