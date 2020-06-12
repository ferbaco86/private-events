class EventsController < ApplicationController
  include EventsHelper

  def new
    @event = Event.new
  end

  def create
    @event = User.find_by(id: session[:user_id]).events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
    @attendance_id = @event.attendances.first.event_attendee.id
    @attendee = User.find(@attendance_id).name
  end

  def index
    @events = Event.all
    @users_id = Event.distinct.pluck(:creator_id)
    @users = []
    @records = []
    @events.each do |event|
      @users.push(event.id,User.select(:id,:name).where(id: event.creator_id))
      @records.push(@users)
      @users = []
    end
  end
end
