class InvitationController < ApplicationController
  def create
    @invitation = Attendance.new(attendance_params)
    redirect_to event_path(@event.id)
  end
end
