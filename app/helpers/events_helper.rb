module EventsHelper
  def event_params
    params.require(:event).permit(:description)
  end

  def show_attendance_info(attendance)
    event_guest_text = 'Name: '

    content_tag :ul do
      attendance.collect do |a|
        concat(tag(:br))
        concat(content_tag(:li, content_tag(:strong, event_guest_text) + a.name))
      end
    end
  end

  def show_all_info(records)
    event_date_text = 'Event Date: '
    event_location_text = 'Location: '
    event_description_text = 'Event Description: '
    event_creator_text = 'Creator Name: '

    content_tag :ul do
      records.collect do |r|
        concat(content_tag(:li, content_tag(:strong, event_date_text) + r[0]))
        concat(content_tag(:li, content_tag(:strong, event_location_text) + r[1]))
        concat(content_tag(:li, content_tag(:strong, event_description_text) + r[2]))
        concat(content_tag(:li, content_tag(:strong, event_creator_text) + r[3].first.name.capitalize))


        concat(tag(:br))
      end
    end
  end
end
