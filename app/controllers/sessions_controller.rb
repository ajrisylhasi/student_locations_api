class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])
    if user&.valid_password?(sign_in_params[:password])
      render json: {token: user.generate_jwt}
    elsif user
      render json: {errors: {"password" => ["is invalid"]}}, status: :unauthorized
    else
      render json: {errors: {"user" => ["doesnt exist."]}}, status: :unauthorized
    end
  end
end
