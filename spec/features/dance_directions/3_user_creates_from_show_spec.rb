require 'rails_helper'

feature 'create a dance_direction from dance_direction#new', %{
  As an Authenticated User
  I want to create new dance_directions
  So I can share dance_directions with other users.
  } do
  # Acceptance
  # User cannot create new dance_directions unless user is signed-in
  # User must povide Comment, Comment_Type
  # If user is not signed-in and tries to create a new dance_direction,
  # they are redirected and prompted to sign-in

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_dd1 = { sequence: 1, mark: "A", measure: "1-8", direction: "Open ladies chain" }
  new_dd2 = { sequence: 2, mark: "B", measure: "1-4", direction: "1's cross and go below, 2's cross up to start a half double figure of 8" }
  new_dd3 = { sequence: 3, mark: "B", measure: "5-8", direction: "1's cast down and 2's meet and lead up" }

  pending 'authorized user successfully create dance_direction
    with valid information from dance#show' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Dance Direction"

    expect(page).to have_content("Sequence")
    expect(page).to have_content("Mark")
    expect(page).to have_content("Measure")
    expect(page).to have_content("Direction")
    expect(page).to have_content("Layout")
    expect(page).to have_content("Done")

    # How to fill_in in a test if I get rid of the label?
    fill_in 'Sequence', with: new_dd1[:sequence].to_s
    fill_in 'Mark', with: new_dd1[:mark].to_s
    fill_in 'Measure', with: new_dd1[:measure].to_s
    fill_in 'Direction', with: new_dd1[:direction].to_s
    click_button "Create Dance direction"

    expect(page).to have_content(new_dd1[:sequence])
    expect(page).to have_content(new_dd1[:mark])
    expect(page).to have_content(new_dd1[:measure])
    expect(page).to have_content(new_dd1[:direction])
    expect(page).to have_content("Create Dance direction")
    expect(page).to have_content("Done")

    fill_in 'Sequence', with: new_dd1[:sequence].to_s
    fill_in 'Mark', with: new_dd1[:mark].to_s
    fill_in 'Measure', with: new_dd1[:measure].to_s
    fill_in 'Direction', with: new_dd1[:direction].to_s
    click_button "Create Dance direction"

    fill_in 'Sequence', with: new_dd1[:sequence].to_s
    fill_in 'Mark', with: new_dd1[:mark].to_s
    fill_in 'Measure', with: new_dd1[:measure].to_s
    fill_in 'Direction', with: new_dd1[:direction].to_s
    click_button "Create Dance direction"
    click_button "Done"

    expect(page).to have_content(new_dd1[:sequence])
    expect(page).to have_content(new_dd1[:mark])
    expect(page).to have_content(new_dd1[:measure])
    expect(page).to have_content(new_dd1[:direction])
    expect(page).to have_content(new_dd2[:sequence])
    expect(page).to have_content(new_dd2[:mark])
    expect(page).to have_content(new_dd2[:measure])
    expect(page).to have_content(new_dd2[:direction])
    expect(page).to have_content(new_dd3[:sequence])
    expect(page).to have_content(new_dd3[:mark])
    expect(page).to have_content(new_dd3[:measure])
    expect(page).to have_content(new_dd3[:direction])
    expect(page).not_to have_content("Create Dance direction")
    expect(page).not_to have_content("Done")
  end

  pending 'authorized user fail to create dance_direction
    with invalid information' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Dance Direction"
    click_button "Create Dance direction"

    expect(page).to have_content("Sequence can't be blank")
  end

  pending 'fail to create a dance_direction with unauthorized user' do
    visit dance_path(dance)

    expect(page).not_to have_content("Create Dance Direction")
  end
end
