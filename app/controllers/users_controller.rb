class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to home_path @user

      send_notification("first_notification", nil)
    else
      flash[:alert] = "User not created"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      flash.now[:alert] = "User not updated"
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      flash[:notice] = "You do not have permission!"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user  == current_user
      @user.destroy
     redirect_to root_path
   end
 end

 def logged_in
   !current_user.nil?
 end

 def home
 end

 def user_params
   params.require(:user).permit(:name, :password, :email, :password_confirmation)
 end

end
