class EventsController < ApplicationController
  include EventsHelper

  def new
    @event = Event.new
  end

  def create
    current_user = User.find_by(id: session[:user_id])
    @event = current_user.events.build(event_params)

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
    @records_future = find_events(@future_events)
    @records_past = find_events(@past_events)
  end
end
