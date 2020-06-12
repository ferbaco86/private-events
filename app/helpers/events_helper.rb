module EventsHelper
  def event_params
    params.require(:event).permit(:description)
  end
end
