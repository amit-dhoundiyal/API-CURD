class Account < ApplicationRecord
	belongs_to :user
	has_many :transactions
  validates :account_number,uniqueness: true



  #This method  is used to transfer money from one user to another.
	 # def self.transfer_money(a)
  #   #sbinding.pry
  #   if Account.find_by(account_number: a.to).present?
  #      confirm= User.find(Account.find_by(account_number: a.from).user_id).account.debit(a.amount) rescue false
  #   if confirm == 1
  #   	User.find(Account.find_by(account_number: a.to).user_id).account.credit(a.amount)
  #   	return true
  #   else 
  #   	return false
  #   end
  #   end

  # end


 #This method is used to withdraw money from the User Account 
  def debit(amount)
  	if Account.find_by(user_id: id).account_balance >= amount
  		Account.find_by(user_id: id).update(account_balance: Account.find_by(user_id: id).account_balance - amount)
  		return 1
  		
  	else
  		errors.add(:id, "Not have enough Balance")
  		#redirect_to send_money_path
  	end
  	
  end


#This method is used to Credit money into the User Account
  def credit(amount)
  	if Account.find_by(user_id: id)
  		Account.find_by(user_id: id).update(account_balance: Account.find_by(user_id: id).account_balance + amount)
      return 1
   	else
   		errors.add(:id, "Reciver Account Not Exists")
   end
  end

	 
end
