class InvitationsController < ApplicationController
  def new
  end
  def create
    @attendance = Attendance.new(event_attendee_id: 1, attended_event_id: 10)

    if @attendance.save
      render :new
    end
  end
end
