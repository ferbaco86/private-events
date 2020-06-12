class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: "Event"
  has_many :attended_event, through: :attendances
  has_many :attendances, foreign_key: :event_attendee_id
end
