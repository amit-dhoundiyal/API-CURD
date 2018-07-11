class UsersController < ApplicationController
  
  def index
    @user = User.new
  end
  

  def show
  @user = User.find(params[:id])
  @qr = RQRCode::QRCode.new(@user.name, :size =>7, :level => :l ) 
  end

  def create
    @user = User.new(user_params)
    if @user.save
    
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

private
def user_params
      params.require(:user).permit(:name, :email, :phone_number)
    end
end
