class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show]

  def show
    if @user
      render json: @user
    else
      render json: {errors: "User not found"}, status: :not_found
    end
  end

  def me
    render json: current_user
  end

  def update
    if current_user.update(user_params) && current_user.save
      render json: current_user
    else
      render json: {errors: current_user.errors}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :fullname, :faculty, :course)
  end
end
