class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy, :show]
  
  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas 
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save!
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path
    end
  end
end
