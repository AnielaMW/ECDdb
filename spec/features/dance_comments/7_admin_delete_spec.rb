require 'rails_helper'

feature 'delete a dance_comment', %Q{
  As a Admin
  I want to delete dance_comments
  So I can delete dance_comments.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the admin

  let!(:lady_r) { FactoryGirl.create(:admin_user) }
  let!(:comment1) { FactoryGirl.create(:dance_comment) }
  let!(:comment2) { FactoryGirl.create(:dance_comment, dance_id: comment1.dance_id) }
  let!(:comment3) { FactoryGirl.create(:dance_comment) }

  scenario 'admin sucessfully delete a dance_comment from dance_comment_path' do
    sign_in lady_r
    visit dance_comment_path(comment1.id)
    click_link "Delete"

    expect(page).to have_current_path(dance_path(comment1.dance))
    expect(page).not_to have_content(comment1.comment)
  end

  pending 'admin sucessfully delete a dance_comment from the dance path' do
    sign_in lady_r
    visit dance_path(comment2.dance)
    click_link "Delete"

    expect(page).to have_current_path(edit_dance_comment_path(comment2))
  end

  pending 'admin sucessfully delete a dance_comment from the dance_comments path' do
    sign_in lady_r
    visit dance_comments_path
    click_link "Delete"

    expect(page).to have_current_path(edit_dance_comment_path(comment3))
  end
end
