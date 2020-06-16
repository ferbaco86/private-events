require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'creating event' do
    it 'description cannot be blank ' do #
      expect { Event.create! }.to raise_error(ActiveRecord::RecordInvalid) # test code
    end
  end

  context 'testing associations' do
    it 'should have many users' do
      e = Event.reflect_on_association(:creator).macro
      expect(e).to eq(:belongs_to)
    end
  end
end
