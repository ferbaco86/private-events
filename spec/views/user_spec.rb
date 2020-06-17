require 'rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Navigate the webpage' do
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
      fill_in 'location', with: 'United States'
      fill_in 'description', with: 'Testing views'
      click_button 'Create Event'
      sleep(5)
      visit root_path
      click_on 'Guest List'
      sleep(5)
    end
  end
end
