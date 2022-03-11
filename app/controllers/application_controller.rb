require "authentication_helper"
class ApplicationController < ActionController::API
  include AuthenticationHelper
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user
end
