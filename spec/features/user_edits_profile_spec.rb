require 'rails_helper'

feature 'edits account', %Q{
  As an authenticated user
  I want to edit my account
  So that I can update my profile
  } do

  # ACCEPTANCE CRITERIA
  # * User can edit first_name
  # * User can edit last_name
  # * User can edit email
  # * If all information is complete, User is updated.
  # * If information is incomplete, User gets error message.

  anne = FactoryGirl.create(:anne)

  pending 'sucessfully update account when user enters valid information' do
    mrs_anne = {first_name: 'Mrs. Anne', last_name: 'Wentworth', email: 'love@lyme.uk'}

    sign_in anne
    visit root_path
    click_link 'Update Profile'
    fill_in 'First Name', with: '#{anne[:first_name]}'
    fill_in 'Last Name', with: '#{anne[:last_name]}'
    fill_in 'Email', with: '#{anne[:email]}'
    fill_in 'Password', with: '#{anne.password}'
    fill_in 'Confirm Password', with: '#{anne.password}'
    fill_in 'Current Password', with: '#{anne.password}'
    click_button 'Update'

    expect(page).to have_content('Sign Out')

    # Visit profile(user#show_path) to verify changes were made?
  end

  pending 'fails to update account when user enters invalid information' do

    sign_in anne
    visit root_path
    click_link 'Update Profile'
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: ''
    click_button 'Update'

    expect(page).to have_content('errors prohibited this user from being saved:')
  end
end
