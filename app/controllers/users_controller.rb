class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifier.send_signup_email(@user).deliver_now
      flash[:notice] = 'Account Successfully Created!'
      session[:user_id] = @user.id
      if @cart.items.count == 0
        redirect_to user_path
      else
        redirect_to cart_path
      end
    else
      flash[:error] = 'Those Are Not Valid Inputs. Please Try Again.'
      redirect_to new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
