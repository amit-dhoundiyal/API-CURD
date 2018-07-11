class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
  #       def send_devise_notification(notification, *args)
		#   Devise::Mailer.send(notification, self, *args).deliver_now
		# end

end
