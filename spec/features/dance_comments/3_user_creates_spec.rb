require 'rails_helper'

feature 'create a dance_comment', %Q{
  As an Authenticated User
  I want to create new dance_comments
  So I can share dance_comments with other users.
  } do
  # Acceptance
  # User cannot create new dance_comments unless user is signed-in
  # User must povide Comment, Comment_Type
  # If user is not signed-in and tries to create a new dance_comment,
  # they are redirected and prompted to sign-in

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:comment_type) { FactoryGirl.create(:comment_type) }
  new_dance_comment = { comment: "Really Great" }

  pending 'authenticated user successfully create dance_comment
    with valid information' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Comment"

    expect(page).to have_current_path(new_dance_comment_path(dance))

    fill_in 'Comment', with: new_dance_comment[:comment].to_s
    select comment_type.name.to_s, from: 'Type'
    click_button "Create Comment"

    expect(page).to have_content(new_dance_comment[:comment])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(comment_type.name)
    expect(page).to have_content(dance.title)
  end

  pending 'authenticated user fail to create dance_comment
    with invalid information' do
    sign_in anne
    visit dance_path(dance)
    click_link "Create Comment"
    click_button "Create Comment"

    expect(page).to have_content(
      "Comment can't be blank, Type can't be blank"
    )
  end

  pending 'fail to create a dance_comment with unauthenticated user' do
    visit dance_path(dance)
    click_link "Create Comment"

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
