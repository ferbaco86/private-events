module UsersHelper
  def user_params
    params.require(:user).permit(:name)
  end

  def show_event_info(event)
    event_title_text = 'Event Title: '
    event_date_text = 'Event Date: '
    event_location_text = 'Location: '
    event_description_text = 'Event Description: '

    content_tag :ul do
      event.collect do |e|
        concat(content_tag(:li, content_tag(:strong, event_title_text) + e.title))
        concat(content_tag(:li, content_tag(:strong, event_date_text) + e.event_date))
        concat(content_tag(:li, content_tag(:strong, event_location_text) + e.location))
        concat(content_tag(:li, content_tag(:strong, event_description_text) + e.description))
        concat(content_tag(:li, link_to("Guest List", event_path(e.id), class: "guest-link-style title is-5 has-text-white has-background-black")) )
        concat(tag(:br))
      end
    end
  end
end
