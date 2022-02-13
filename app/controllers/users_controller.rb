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

  def update_me
    if current_user.update(user_params) && current_user.save
      render json: current_user
    else
      render json: {errors: current_user.errors}, status: :unprocessable_entity
    end
  end

  def update_password
    if current_user.update(user_params) && current_user.save
      render json: current_user
    else
      render json: {errors: current_user.errors}, status: :unprocessable_entity
    end
  end

  def destroy_me
    if current_user.destroy
      render json: {response: "User with id: #{current_user.id} deleted successfuly"}, status: :ok
    elsif !current_user
      render json: {response: "User with id: #{current_user.id} wasnt found"}, status: :not_found
    else
      render json: {response: "User with id: #{current_user.id} couldnt be deleted."}, status: :bad_request
    end
  end

  def update
    render json: {errors: "Not Allowed"}, status: :unprocessable_entity
  end

  def index
    @users = User.all
    render json: @users
  end

  def destroy
    render json: {errors: "Not Allowed"}, status: :unprocessable_entity
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :fullname, :faculty, :course)
  end
end
