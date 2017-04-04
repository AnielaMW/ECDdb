require 'rails_helper'

feature 'fail to delete a dance_comment', %{
  As an Unauthenticated User
  I want to delete my dance_comments
  So I can delete dance_comments I have created.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  let!(:clay) { FactoryGirl.create(:anne) }
  let!(:comment1) { FactoryGirl.create(:dance_comment) }
  let!(:comment2) { FactoryGirl.create(:dance_comment,
    dance_id: comment1.dance_id) }
  let!(:comment3) { FactoryGirl.create(:dance_comment) }

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_comment_path' do
    visit dance_comment_path(comment1.id)
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_comment_path' do
    sign_in clay
    visit dance_comment_path(comment1.id)
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_path' do
    visit dance_path(comment2.dance_id)
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_path' do
    sign_in clay
    visit dance_path(comment2.dance_id)
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_comments_path' do
    visit dance_comments_path
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_comments_path' do
    sign_in clay
    visit dance_comments_path
    expect(page).not_to have_content("Delete")
  end
end
