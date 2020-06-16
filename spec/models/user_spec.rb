require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creating user' do
    #let (:user){ User.new }
    it 'name cannot be blank ' do   #
      expect{ User.create!}.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
  
  context 'testing associations' do
    it "should have many events" do
      u = User.reflect_on_association(:events)
      expect(u.macro).to eq(:has_many)
    end
  end
end
