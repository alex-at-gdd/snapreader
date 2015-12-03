class UsersController < ApplicationController

  def signup
    @user = User.new(user_params)
    if @user.save
      self.current_user = @user
      redirect_to root_path
    else
      flash[:error] = @user.errors.map{|e| "#{e} is required"}
      redirect_to root_path
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