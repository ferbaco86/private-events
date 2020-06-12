class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = session[:user_id].events.build

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end
end
