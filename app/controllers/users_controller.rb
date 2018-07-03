class UsersController < ApplicationController
	

	def index
	end

	def view
       @transactions =Transaction.where(account_id: User.find(current_user.id).account.id) rescue nil
	end

	def credit
	end

	def debit
	end


	

end
