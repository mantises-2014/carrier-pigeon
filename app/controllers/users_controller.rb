class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end

  def show
    # @user = User.find(session[:user_id])
    @user = User.find(params[:id])

  end

  private

  def user_params
      params.require(:user).permit(:name, :username, :email, :password, :city)
  end

end
