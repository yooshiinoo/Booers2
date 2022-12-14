class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updateed user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user)
    end
  end

end
