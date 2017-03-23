require 'rails_helper'

feature 'deletes account', %Q{
  As an authenticated user
  I want to delete my account
  So that my profile is no longer retained
  } do

  # ACCEPTANCE CRITERIA
  # * User can delete account

  pending 'sucessfully delete account' do
    mrs_clay = FactoryGirl.create(:mrs_clay)

    sign_in mrs_clay
    visit root_path
    click_link 'Update Profile'
    click_button 'Cancle My Account'

    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Sign In')
  end
end
