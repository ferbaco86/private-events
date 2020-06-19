module InvitationsHelper
  def invitation_params
    params.require(:attendance).permit(:event_attendee_id, :attended_event_id)
  end
end
