class SessionsController < ApplicationController
  def new; end

  def create
    @user_temp = User.find_by(name: params[:username_login])

    if @user_temp
      session[:user_id] = @user_temp.id
      session[:username] = @user_temp.name

      redirect_to root_path

    else
      render json: { status: 401 }
    end
  end

  def log_in
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil

    redirect_to root_path
  end
end
