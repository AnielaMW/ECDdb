require 'rails_helper'

feature 'delete a dance_comment', %Q{
  As an Authenticated User
  I want to delete my dance_comments
  So I can delete dance_comments I have created.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  let!(:comment1) { FactoryGirl.create(:dance_comment) }
  let!(:clay) { FactoryGirl.create(:anne) }

  pending 'sucessfully delete a dance_comment when authenticated user' do
    sign_in comment1.user
    visit dance_comment_path(comment1.id)
    click_link "Delete"

    expect(page).to have_current_path(dance_path(comment1.dance))
    expect(page).not_to have_content(comment1.comment)
  end

  pending 'fail to see "Delete" button with unauthenticated user' do
    visit dance_comment_path(comment1.id)
    expect(page).not_to have_content("Delete")
  end

  pending 'fail to see "Delete" button
    if authenticated user is not the creator' do
    sign_in clay
    visit dance_comment_path(comment1.id)
    expect(page).not_to have_content("Delete")
  end
end
