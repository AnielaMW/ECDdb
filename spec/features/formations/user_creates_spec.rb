require 'rails_helper'

feature 'create a formation', %Q{
  As an Authenticated User
  I want to create a new formation
  So I can select that formation for new dances.
  } do
  # Acceptance
  # User cannot create new formations unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new formations.

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_formation = { name: "", description: "" }

  pending 'authenticated user successfully create formation
    with valid information' do
    sign_in anne
    visit new_dance_path
    click_link "New Formation"

    expect(page).to have_current_path(new_formation_path)

    fill_in 'Name', with: new_formation[:name].to_s
    fill_in 'Description', with: new_formation[:description].to_s
    click_button "Create Formation"


  end

  pending 'authenticated user fail to create formation
    with invalid information' do

    expect(page).to have_content(
      "Name can't be blank, Description can't be blank"
    )
  end

  pending 'fail to create a formation with unauthenticated user' do
    visit root_path
    click_link "Create Dance"

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
