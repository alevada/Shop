
class ApplicationController < ActionController::Base
  before_action :authenticate_with_http_digest

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to login_url
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
end
