class SessionsController < ApplicationController
  def create
    respond_to do |format|
      if user = (User.find_by username: params[:username])
        session[:user_id] = user.id
        format.html { redirect_to toys_path, notice: 'Session was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
    end
  end
end
