class UsersController < ApplicationController

  def signup
    if self.current_user = User.create(user_params)
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.map{|e| e.to_s}
    end
  end

  def login
    if self.current_user = User.authenticate(user_params)
      redirect_to root_path
    else
      flash[:error] = "Incorrect login details."
      redirect_to root_path
    end
  end

  def logout
    forget_me!
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :name)
    end
end