class User < ApplicationRecord

  validates :name, presence: true
  validates :email, :phone_number, presence: true, uniqueness: true
end
