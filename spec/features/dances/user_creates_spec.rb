require 'rails_helper'

feature 'create a dance', %Q{
  As an Authenticated User
  I want to create new dances
  So I can share dances with other users.
  } do
  # Acceptance
  # User cannot create new dances unless user is signed-in
  # User must povide Title, Formation, Meter, Dance_Instructions
  # User may provide Author, Year, Publication
  # If user is not signed-in and tries to create a new dance, they are redirected and prompted to sign-in

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:form) { FactoryGirl.create(:formation) }
  let!(:met) { FactoryGirl.create(:meter) }
  new_dance = { title: "My New Dance",
                author: "Louisa M.",
                publication: "Dance Books",
                year: "2016",
                direction: "2nd couple right hand turn"}

  scenario 'successfully create a dance when authenticated user provides valid information'do
    sign_in anne
    visit root_path
    click_link "Create Dance"

    expect(page).to have_current_path(new_dance_path)

    fill_in 'Title', with: "#{new_dance[:title]}"
    select "#{form.name}", from: 'Formation'
    select "#{met.name}", from: 'Meter'
    fill_in 'Direction', with: "#{new_dance[:direction]}"
    click_button "Create Dance"

    expect(page).to have_content(new_dance[:title])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(form.name)
    expect(page).to have_content(met.name)
    expect(page).to have_content(new_dance[:direction])
  end

  scenario 'successfully create a dance when authenticated user provides all information'do
    sign_in anne
    visit root_path
    click_link "Create Dance"
    fill_in 'Title', with: "#{new_dance[:title]}"
    select "#{form.name}", from: 'Formation'
    select "#{met.name}", from: 'Meter'
    fill_in 'Author', with: "#{new_dance[:author]}"
    fill_in 'Year', with: "#{new_dance[:year]}"
    fill_in 'Publication', with: "#{new_dance[:publication]}"
    fill_in 'Direction', with: "#{new_dance[:direction]}"
    click_button "Create Dance"

    expect(page).to have_content(new_dance[:title])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(form.name)
    expect(page).to have_content(met.name)
    expect(page).to have_content(new_dance[:author])
    expect(page).to have_content(new_dance[:publication])
    expect(page).to have_content(new_dance[:year])
    expect(page).to have_content(new_dance[:direction])
  end

  scenario 'fail to create a dance when authenticated user provides invalid information'do
    sign_in anne
    visit root_path
    click_link "Create Dance"
    click_button "Create Dance"

    expect(page).to have_content("Title can't be blank, Direction can't be blank")
  end

  scenario 'fail to create a dance with unauthenticated user' do
    visit root_path
    click_link "Create Dance"

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_current_path(new_user_session_path)
  end
end
