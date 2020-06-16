class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :event_attendee
  belongs_to :creator, class_name: "User"

  def future
    time = Time.now
    Event.select(:id,:event_date,:location,:description,:creator_id).where("event_date > ?", time.to_formatted_s(:db))
  end

  def past
    time = Time.now
    Event.select(:id,:event_date,:location,:description,:creator_id).where("event_date <= ?", time.to_formatted_s(:db))
  end
end
