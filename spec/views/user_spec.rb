require 'rails_helper'

RSpec.describe "the signin process", type: :feature do
  before :each do
    User.make(name: 'Vader')
  end

  it "signs me in" do
    visit '/users/new'
    within("#users") do
      fill_in 'name', with: 'vader'
    end
    click_button 'Create User'
    expect(page).to have_content 'Success'
  end
end