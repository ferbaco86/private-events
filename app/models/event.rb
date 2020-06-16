class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :event_attendee
  belongs_to :creator, class_name: "User"
end
