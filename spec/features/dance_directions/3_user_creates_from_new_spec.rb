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
  let!(:direction_type) { FactoryGirl.create(:direction_type) }
  new_dance_direction = { direction: "Really Great" }

  pending 'authenticated user successfully create dance_direction
    with valid information from dance_direction#new' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Comment"

    expect(page).to have_current_path(new_dance_dance_direction_path(dance))

    # How to fill_in in a test if I get rid of the Comment label?
    fill_in 'Comment', with: new_dance_direction[:direction].to_s
    select direction_type.name.to_s, from: 'Type'
    click_button "Create Dance direction"

    expect(page).to have_content(new_dance_direction[:direction])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(direction_type.name)
    expect(page).to have_content(dance.title)
  end

  pending 'authenticated user fail to create dance_direction
    with invalid information from dance_direction#new' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Comment"
    click_button "Create Dance direction"

    expect(page).to have_content("Comment can't be blank")
  end

  pending 'fail to create a dance_direction with unauthenticated user from
    dance_direction#new' do
    visit dance_path(dance)
    click_link "Create Comment"

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
