require 'rails_helper'

feature 'views account', %{
  As a user
  I want to view accounts
  So that I can see public profiles of users
  } do

  # ACCEPTANCE CRITERIA
  # * User can view the first_name of users
  # * User cannot view the last_name, password, email of users
  # * click a link to thier comments and dances

  let!(:anne) { FactoryGirl.create(:anne) }

  pending 'sucessfully view profile' do
    visit user_path(anne)

    expect(page).to have_content(anne.first_name)
    expect(page).not_to have_content(anne.last_name)
    expect(page).not_to have_content(anne.email)
    expect(page).not_to have_content(anne.password)
  end
end
