class InvitationsController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  def create
    @attendance = Attendance.new(:event_attendee_id => params[:event_attendee_id], :attended_event_id => params[:attended_event_id])

    if @attendance.save
      redirect_to root_path
    end
  end
end
