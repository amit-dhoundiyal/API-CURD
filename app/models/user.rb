class User < ApplicationRecord
	has_one :account,dependent: :destroy
  has_many :transactions
  
  
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

   validates :phone_number,uniqueness: true
   after_create :enter_account_number

  
  #This method is used to Make the User Phone number As the Account number.
   def enter_account_number
 
   	Account.create(account_number: self.phone_number,user_id: self.id)
   end


   
end
