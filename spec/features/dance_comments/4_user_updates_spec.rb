require 'rails_helper'

feature 'update a dance_comment', %Q{
  As an Authenticated User
  I want to update my dance_comments
  So I can edit dance_comments I have created.
  } do
  # Acceptance
  # User cannot edit dance_comments unless user is signed-in
  # User cannot edit dance_comments unless they are the creator
  # User must povide Title, Formation, Meter, Dance_Instructions
  # User may provide Author, Year, Publication
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not the creator, they cannot see the 'Edit' button

  let!(:comment1) { FactoryGirl.create(:dstyle_comment) }
  let!(:type) { FactoryGirl.create(:comment_type) }
  changes = { comment: "My New Fav Dance" }
  let!(:clay) { FactoryGirl.create(:anne) }

  pending 'authenticated user sucessfully update dance_comment with valid information' do
    sign_in comment1.user
    visit dance_comment_path(comment1.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_dance_comment_path(comment1))

    fill_in 'Comment', with: changes[:comment].to_s
    select type.name.to_s, from: 'Type'
    click_button "Update"

    expect(page).to have_current_path(dance_comment_path(comment1.id))
    expect(page).to have_content(changes[:comment])
    expect(page).to have_content(comment1.user.first_name)
    expect(page).to have_content(type.name)
  end

  pending 'authenticated user fail to update dance_comment with invalid information' do
    sign_in comment1.user
    visit dance_comment_path(comment1.id)
    click_link "Edit"
    fill_in 'Comment', with: ""
    select "", from: 'Type'
    click_button "Update"

    expect(page).to have_content("Name can't be blank, Type can't be blank")
  end

  pending 'fail to see "Edit" button with unauthenticated user' do
    visit dance_comment_path(comment1.id)

    expect(page).not_to have_content("Edit")
  end

  pending 'fail to see "Edit" button if authenticated user is not the creator' do
    sign_in clay
    visit dance_comment_path(comment1.id)

    expect(page).not_to have_content("Edit")
  end
end
