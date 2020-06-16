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
    @attendance_ids = @event.attendances
    @attendees = []
    @attendance_ids.each do |attendance_id|
      @attendees.push(User.find(attendance_id.event_attendee_id))
    end
  end

  def index
    @future_events = Event.future
    @past_events = Event.past
    @event_info = []
    @records_future = []
    @records_past = []
    @future_events.each do |event|
      @event_info.push(event.event_date,event.location,event.description,User.select(:id,:name).where(id: event.creator_id))
      @records_future.push(@event_info)
      @event_info = []
    end
    @past_events.each do |event|
      @event_info.push(event.event_date,event.location,event.description,User.select(:id,:name).where(id: event.creator_id))
      @records_past.push(@event_info)
      @event_info = []
    end
  end
end
