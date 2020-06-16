class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :event_attendee
  belongs_to :creator, class_name: "User"

  scope :future, -> { select(:id,:event_date,:location,:description,:creator_id).where("event_date > ?", Time.now.to_formatted_s(:db)) }

  scope :past, -> { select(:id,:event_date,:location,:description,:creator_id).where("event_date <= ?", Time.now.to_formatted_s(:db)) }

end
