require 'rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Create new user' do
    it 'creates a new user' do
      visit new_user_path
      fill_in 'name', with: 'Luke'
      click_button 'Create User'
      sleep(5)
      visit '/sessions/log_in'
      fill_in 'username_login', with: 'Luke'
      click_button 'Login'
      sleep(5)
      visit new_event_path
      fill_in 'description', with: 'Testing views'
      click_button 'Create Event'
      sleep(5)
    end
  end
end

# RSpec.describe "the signin process", type: :system do
#   before :each do
#     User.make(name: 'Vader')
#   end

#   it "signs me in" do
#     visit '/users/new'
#     within("#users") do
#       fill_in 'name', with: 'vader'
#     end
#     click_button 'Create User'
#     expect(page).to have_content 'Success'
#   end
# end
