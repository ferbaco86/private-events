module UsersHelper
  def user_params
    params.require(:user).permit(:name)
  end

  def show_event_info(event)
    event_date_text = 'Event Date: '
    event_location_text = 'Location: '
    content_tag :ul do
      event.collect do |e|
        concat(content_tag(:li, content_tag(:strong, event_date_text) + e.event_date))
        concat(content_tag(:li, content_tag(:strong, event_location_text) + e.location))
        concat(tag(:br))
      end
    end
  end

  def attended_event
    @attendances.collect do |attendance|
      attendance.find_by(event_attendee: session[:user_id])
    end
  end
end
