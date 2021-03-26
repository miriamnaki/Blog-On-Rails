class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Thank you for signing up! You are now logged in'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      flash[:notice] = 'Your infomation has been updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit_password
    @user = current_user

    current_password = params[:current_pasword]
    password = params[:new_password]
    password_confirmation = params[:new_password_confirmation]

end

def update_password
  @user=current_user
  if @user&.authenticate(params[:user][:current_password])
      if @user.update(user_params) 
          flash[:notice] = "Password changed successfully"
          redirect_to root_path
      else
          flash[:notice] = "Passwords did not match, please try again!"
          render :edit_password
      end
  else
      flash[:notice] = "Wrong current password"
      render :edit_password
  end
end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
