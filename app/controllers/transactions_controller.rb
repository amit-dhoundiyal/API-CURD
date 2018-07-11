class TransactionsController < ApplicationController
  
  #This method is used to Perform the money Transfer from one User to another
	def sendmoney
		@transactions=Transaction.new
		@transactions.from=User.find(current_user.id).account.account_number
		@transactions.typeof="Debit"
		@dropdown=Account.all.select(:account_number).collect{|i| i.account_number}
		@dropdown.delete_at(@dropdown.index(@transactions.from))
	end



#This method is used to Perform the Transaction from one User to another
	def create
		@transactions=Transaction.new(content)
		#a=Account.transfer_money(@transactions)
		# if a
		# 	@sam = @transactions.dup
		# 	@transactions.account_id=Account.find_by(user_id: current_user.id).id
		# 	@transactions.save!	
		# 	@sam.account_id=Account.find_by(account_number: @sam.to).id
		# 	@sam.typeof="credit"
		# 	@sam.save					
 	# 		redirect_to root_path
 			#binding.pry
 	    if Account.find_by(account_number: @transactions.to).present? && User.find(Account.find_by(account_number: @transactions.from).user_id).account.debit(@transactions.amount) && User.find(Account.find_by(account_number: @transactions.to).user_id).account.credit(@transactions.amount)
 	    	@sam = @transactions.dup
 	    	@transactions.account_id=Account.find_by(user_id: current_user.id).id
 	    	@transactions.save!
 	    	@sam.account_id=Account.find_by(account_number: @sam.to).id
 	    	@sam.typeof="credit"
 	    	@sam.save
 	    	redirect_to root_path
		else
			render :sendmoney
		end
	
	end

#This method is used to Credit the amount into the user Account
	def credit
      @transactions=Transaction.new
      @transactions.typeof= "Credit"
      @transactions.from=User.find(current_user.id).account.account_number
      @transactions.to=User.find(current_user.id).name  
	end


#This method is used to debit the amount from the user Account
	def debit
	  @transactions=Transaction.new
      @transactions.typeof= "Debit"
      @transactions.from=User.find(current_user.id).account.account_number
      @transactions.to=User.find(current_user.id).name
	end


   def find
    @user =User.find(Account.find_by(account_number: params[:account_number] ).user_id).name
     
   respond_to do |format|
      format.js   { render :layout => false }
   end
end

#This method is used to make the transaction into the user Account
	def mytransaction
		@transactions=Transaction.new(content)
		confirm = 0
		if @transactions.typeof == "Credit"
			@transactions.description= "Credit"
			confirm= User.find(Account.find_by(account_number: @transactions.from).user_id).account.credit(@transactions.amount)
		else
			@transactions.description= "Debit"
			confirm= User.find(Account.find_by(account_number: @transactions.from).user_id).account.debit(@transactions.amount)
		end

		if confirm == 1
			@transactions.account_id=Account.find_by(user_id: current_user.id).id
			@transactions.save
			confirm = 0
			redirect_to root_path
		end 		
	end



private
	def content
		params.require(:transactions).permit(:from ,:to,:amount, :typeof, :description)
		
	end
end
