class InvitationsController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(event_attendee_id: params[:event_attendee_id],
                                 attended_event_id: params[:attended_event_id])

    redirect_to root_path if @attendance.save
  end
end
