class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to new_user_path if @user.save
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    @user = User.find_by(params[:name])
    session[:current_user_id] = @user.id
    if session[:current_user_id] != nil
      render :show
    end
  end
end
