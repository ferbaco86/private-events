class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: "Event"
  has_many :attended_event, through: :attendances
  has_many :attendances, foreign_key: :event_attendee_id

  def upcoming_events
    time = Time.now
    @upcoming_events = Event.select(:id,:event_date,:location,:description).where("event_date > ?", time.to_formatted_s(:db))
  end

  def previous_events
    time = Time.now
    @previous_events = Event.select(:id,:event_date,:location,:description).where("event_date <= ?", time.to_formatted_s(:db))
  end
end
