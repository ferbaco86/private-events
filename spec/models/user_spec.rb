require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creating user' do
    #let (:user){ User.new }
    it 'name cannot be blank ' do   #
      expect{ User.create(:name => "")}.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
  
end
