class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticated?

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  private def authenticated?
    true
  end
end
