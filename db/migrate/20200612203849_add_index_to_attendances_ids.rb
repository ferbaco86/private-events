class AddIndexToAttendancesIds < ActiveRecord::Migration[5.2]
  def change
    add_index :attendances, :attended_event_id
    add_index :attendances, :event_attendee_id
  end
end
