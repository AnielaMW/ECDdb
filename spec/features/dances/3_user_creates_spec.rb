require 'rails_helper'

feature 'create a dance', %{
  As an Authenticated User
  I want to create new dances
  So I can share dances with other users.
  } do
  # Acceptance
  # User cannot create new dances unless user is signed-in
  # User must povide Title, Formation, Meter
  # User may provide Choreographer, Year, Publication
  # If user is not signed-in and tries to create a new dance,
  # they are redirected and prompted to sign-in

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:form) { FactoryGirl.create(:formation) }
  let!(:met) { FactoryGirl.create(:meter) }
  new_dance = { title: "My New Dance",
                choreographer: "Louisa M.",
                publication: "Dance Books",
                year: "2016" }

  pending 'authenticated user successfully create dance
    with valid information' do
    sign_in anne
    visit root_path
    click_link "Create Dance"

    expect(page).to have_current_path(new_dance_path)

    fill_in 'Title', with: new_dance[:title].to_s
    select form.name.to_s, from: 'Formation'
    select met.name.to_s, from: 'Meter'
    click_button "Create Dance"

    expect(page).to have_content(new_dance[:title])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(form.name)
    expect(page).to have_content(met.name)
  end

  pending 'authenticated user successfully create dance
    with all information' do
    sign_in anne
    visit root_path
    click_link "Create Dance"
    fill_in 'Title', with: new_dance[:title].to_s
    select form.name.to_s, from: 'Formation'
    select met.name.to_s, from: 'Meter'
    fill_in 'Choreographer', with: new_dance[:choreographer].to_s
    fill_in 'Year', with: new_dance[:year].to_s
    fill_in 'Publication', with: new_dance[:publication].to_s
    click_button "Create Dance"

    expect(page).to have_content(new_dance[:title])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(form.name)
    expect(page).to have_content(met.name)
    expect(page).to have_content(new_dance[:choreographer])
    expect(page).to have_content(new_dance[:publication])
    expect(page).to have_content(new_dance[:year])
  end

  pending 'authenticated user fail to create dance
    with invalid information' do
    sign_in anne
    visit root_path
    click_link "Create Dance"
    click_button "Create Dance"

    expect(page).to have_content(
      "Title can't be blank, Direction can't be blank"
    )
  end

  scenario 'fail to create a dance with unauthenticated user' do
    visit root_path
    click_link "Create Dance"

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
