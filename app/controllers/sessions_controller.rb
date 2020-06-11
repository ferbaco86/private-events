class SessionsController < ApplicationController

  def new
    @user = User.new 
  end
  def create
      @user = User.find_by(params[:name])
      session[:current_user_id] = @user.id
      if session[:current_user_id] != nil
        redirect_to users_path
      end
  end
  
  def log_in
    @user = User.find_by(params[:name])

  end

  def destroy
  end
end
