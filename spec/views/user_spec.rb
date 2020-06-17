require 'rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Navigate the webpage' do
    it 'creates a new user' do
      visit new_user_path
      fill_in 'name', with: 'Vader'
      click_button 'Create User'
      sleep(3)
      visit new_user_path
      fill_in 'name', with: 'Luke'
      click_button 'Create User'
      sleep(3)
      visit '/sessions/log_in'
      fill_in 'username_login', with: 'Luke'
      click_button 'Login'
      sleep(3)
      visit new_event_path
      fill_in 'title', with: 'Test Title'
      fill_in 'location', with: 'United States'
      fill_in 'description', with: 'Testing views'
      click_button 'Create Event'
      sleep(3)
      visit root_path
      click_on 'Guest List'
      sleep(3)
      click_on 'Add Guest'
      find('#event_attendee_id').find(:xpath, 'option[1]').select_option
      click_on 'Add Guest'
      visit root_path
      click_on 'Guest List'
      sleep(3)
    end
  end
end
