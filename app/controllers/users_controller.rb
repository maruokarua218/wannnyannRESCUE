class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to pets_path
    end
    @users = @user.following
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def index
    @pets = Pet.all
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :client)
  end
end
