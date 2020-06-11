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
end
