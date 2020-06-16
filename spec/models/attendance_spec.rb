require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'testing associations' do
    it "should have many events" do
      a = Attendance.reflect_on_association(:event_attendee)
      expect(a.macro).to eq(:belongs_to)
    end
    it "should have many users" do
      a = Attendance.reflect_on_association(:attended_event)
      expect(a.macro).to eq(:belongs_to)
    end
  end
end