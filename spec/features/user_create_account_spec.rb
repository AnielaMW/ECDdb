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

  new_user = { first_name: 'William',
    last_name: 'Elliot',
    email: 'heir@kellage.uk',
    password: 'readytoinherit'
  }

  pending 'sucessfully create account when user enters valid information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: '#{new_user[:first_name]}'
    fill_in 'Last Name', with: '#{new_user[:last_name]}'
    fill_in 'Email', with: '#{new_user[:email]}'
    fill_in 'Password', with: '#{new_user[:password]}'
    fill_in 'Confirm Password', with: '#{new_user[:password]}'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome!')
    expect(page).to have_content('Sign Out')
  end

  pending 'fails to create account when user enters invalid information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content('errors prohibited this user from being saved:')
    expect(page).to have_content('Sign Up')
  end

  pending 'fails to create account when user password and confirm password do not match' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: '#{new_user[:first_name]}'
    fill_in 'Last Name', with: '#{new_user[:last_name]}'
    fill_in 'Email', with: '#{new_user[:email]}'
    fill_in 'Password', with: '#{new_user[:password]}'
    fill_in 'Confirm Password', with: 'playingbothsides'
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to have_content('Sign Up')
  end
end
