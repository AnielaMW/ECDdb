require 'rails_helper'

feature 'create account', %Q{
  As a User
  I want to create an account
  So that I can login
  } do
  # Acceptance
  # * User must specify first_name
  # * User must specify last_name
  # * User must specify email
  # * User must specify and confirm password.
  # * If all information is complete, User is registered and authenticated.
  # * If information is incomplete, User gets error message.

  william = { first_name: 'William',
              last_name: 'Elliot',
              email: 'heirtowalter@kellage.com',
              password: 'readytoinherit' }

  scenario 'sucessfully create account when user enters valid information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "#{william[:first_name]}"
    fill_in 'Last Name', with: "#{william[:last_name]}"
    fill_in 'Email', with: "#{william[:email]}"
    fill_in 'Password', with: "#{william[:password]}"
    fill_in 'Confirm Password', with: "#{william[:password]}"
    click_button 'Sign Up'

    expect(page).to have_content('Welcome!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'fails to create account when user enters invalid information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content('
    errors prohibited this user from being saved:')
    expect(page).to have_content('Sign Up')
  end

  scenario 'fails to create account when user password and
  confirm password do not match' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: '#{william[:first_name]}'
    fill_in 'Last Name', with: '#{william[:last_name]}'
    fill_in 'Email', with: '#{william[:email]}'
    fill_in 'Password', with: '#{william[:password]}'
    fill_in 'Confirm Password', with: 'playingbothsides'
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to have_content('Sign Up')
  end
end
