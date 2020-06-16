class User < ApplicationRecord
  has_many :attendances, foreign_key: :event_attendee_id
  has_many :attended_event, through: :attendances
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  validates :name, presence: true

  scope :upcoming_events, lambda { |user_id|
                            User.find(user_id)
                              .attended_event
                              .select(:id,
                                      :event_date,
                                      :location,
                                      :description).where('event_date > ?', Time.now.to_formatted_s(:db))
                          }

  scope :previous_events, lambda { |user_id|
                            User.find(user_id)
                              .attended_event
                              .select(:id,
                                      :event_date,
                                      :location,
                                      :description).where('event_date <= ?', Time.now.to_formatted_s(:db))
                          }
end
