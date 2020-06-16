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
    #@current_user = User.find(session[:user_id])
    @event = @user.events
    @attendances = @user.attendances
    @attended_events = []
    @upcoming_events = User.upcoming_events(@user.id)
    @previous_events = User.previous_events(@user.id)
    @attendances.each do |attendance|
      @attended_events.push(Event.find(attendance.attended_event_id))
    end
  end

end
