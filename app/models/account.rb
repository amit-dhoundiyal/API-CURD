class Account < ApplicationRecord
	belongs_to :user
	has_many :transactions
  validates :account_number,uniqueness: true



  #This method  is used to transfer money from one user to another.
	 def self.transfer_money(a)
       confirm= User.find(Account.find_by(account_number: a.from).user_id).account.debit(a.amount)
    if confirm == 1
    	User.find(Account.find_by(account_number: a.to).user_id).account.credit(a.amount)
    	return true
    else 
    	return false
    end

  end


 #This method is used to withdraw money from the User Account 
  def debit(amount)
  	if Account.find(id).account_balance >= amount
  		Account.find(id).update(account_balance: Account.find(id).account_balance - amount)
  		return 1
  		
  	else
  		errors.add(:id, "Not have enough Balance")
  		#redirect_to send_money_path
  	end
  	
  end


#This method is used to Credit money into the User Account
  def credit(amount)
  	if Account.find(id)
  		Account.find(id).update(account_balance: Account.find(id).account_balance + amount)
      return 1
   	else
   		errors.add(:id, "Account Not Exists")
   end
  end

	 
end
