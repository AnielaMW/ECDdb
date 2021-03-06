require 'rails_helper'

feature 'create a meter', %{
  As an Authenticated User
  I want to create a new meter
  So I can select that meter for new dances.
  } do
  # Acceptance
  # User cannot create new meters unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new meters.

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_meter = { name: "1/2", description: "I have no idea" }

  scenario 'authenticated user successfully create meter
    with valid information' do
    sign_in anne
    visit meters_path
    click_link "New Meter"

    expect(page).to have_current_path(new_meter_path)

    fill_in 'Name', with: new_meter[:name].to_s
    fill_in 'Description', with: new_meter[:description].to_s
    click_button "Create Meter"
    visit meters_path

    expect(page).to have_content(new_meter[:name])
  end

  scenario 'authenticated user fail to create meter
    with invalid information' do
    sign_in anne
    visit meters_path
    click_link "New Meter"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button "Create Meter"

    expect(page).to have_content(
      "Name can't be blank, Description can't be blank"
    )
  end

  scenario 'fail to create a meter with unauthenticated user' do
    visit new_dance_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
