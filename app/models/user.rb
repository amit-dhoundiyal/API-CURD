class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true,length: {minimum: 3} 
	validates :password, presence: true, on: :create, length: {minimum: 5} 

	has_secure_password
end
