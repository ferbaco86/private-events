class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendances, source: :event_attendee
  has_many :attendances, foreign_key: :attended_event_id
end
