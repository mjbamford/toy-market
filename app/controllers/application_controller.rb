class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_or_create_by! username: 'sallyseller'
  end
end
