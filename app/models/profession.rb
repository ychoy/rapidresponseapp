class Profession < ApplicationRecord
  has_many :expertises
  has_many :users
end
