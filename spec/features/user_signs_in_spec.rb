require 'rails_helper'

feature 'sign_in to account', %Q{
  As a user
  I want to sign in to my account
  So that I cen be signed-in
  } do

  # ACCEPTANCE CRITERIA
  # * User provide email
  # * User provide password
  # * If information is incomplete, User gets error message.
  # * If information is invalid, User gets error message.

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:william) { email: 'two_faced@bath.com', password: 'lied4money' }

  pending 'sucessfully sign_in when user enters valid information' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: '#{anne.email}'
    fill_in 'Password', with: '#{anne.password}'
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    # Expect users first_name to appear on the page.
  end

  pending 'fails to sign_in when user enters incomplete information' do
    visit root_path
    click_link 'Sign In'
    click_button 'Sign In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end

  pending 'fails to sign_in when user enters invalid email' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: '#{william.email}'
    fill_in 'Password', with: '#{anne.password}'
    click_button 'Sign In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end

  pending 'fails to sign_in when user enters invalid password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: '#{anne.email}'
    fill_in 'Password', with: '#{william.password}'
    click_button 'Sign In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end
end
