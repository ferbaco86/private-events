module EventsHelper
  def event_params
    params.require(:event).permit(:event_date, :location, :description, :title)
  end

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :event_attendee_id)
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
    event_title_text = 'Event Title: '

    content_tag :ul do
      records.collect do |r|
        concat(content_tag(:li, content_tag(:strong, event_title_text) + r[5]))
        concat(content_tag(:li, content_tag(:strong, event_date_text) + r[0]))
        concat(content_tag(:li, content_tag(:strong, event_location_text) + r[1]))
        concat(content_tag(:li, content_tag(:strong, event_description_text) + r[2]))
        concat(content_tag(:li, content_tag(:strong, event_creator_text) + r[3].first.name.capitalize))
        concat(content_tag(:li, link_to('Guest List',
                                        event_path(r[4]),
                                        class: 'guest-link-style title is-5 has-text-white has-background-black')))

        concat(tag(:br))
      end
    end
  end

  def find_events(events)
    @event_info = []
    @records = []
    events.each do |event|
      @event_info.push(event.event_date,
                       event.location,
                       event.description,
                       User.select(:id, :name).where(id: event.creator_id),
                       event.id,
                       event.title)
      @records.push(@event_info)
      @event_info = []
    end
    @records
  end
end
