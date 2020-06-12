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
    @attendance_ids = @event.attendances.all
    @attendees = []
    @attendance_ids.each do |attendance_id|
      #@attendees.push(attendance_id)
      @attendees.push(User.find(attendance_id.event_attendee_id))
    end
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
