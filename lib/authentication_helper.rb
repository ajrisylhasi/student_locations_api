module AuthenticationHelper
  def authenticate_user!(_options={})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username fullname])
  end

  def authenticate_user
    header = request.headers["Authorization"]
    if header.present?
      begin
        @decoded = JWT.decode(header, Rails.application.secret_key_base).first
        @current_user_id = @decoded["id"]
      rescue ActiveRecord::RecordNotFound => e
        render json: {errors: e.message}, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :unauthorized
      end
    end
  end
end
