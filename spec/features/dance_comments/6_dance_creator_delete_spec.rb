require 'rails_helper'

feature 'delete a dance_comment', %{
  As an Dance Creator
  I want to delete dance_comments posted to my dance
  So I can delete dance_comments I don't want posted to my dance.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator of the parent dance

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:comment1) { FactoryGirl.create(:dance_comment, dance_id: dance.id) }
  let!(:comment2) { FactoryGirl.create(:dance_comment, dance_id: dance.id) }
  let!(:comment3) { FactoryGirl.create(:dance_comment) }

  pending 'dance_creator sucessfully delete a dance_comment from dance_comment_path' do
    sign_in dance.user
    visit dance_comment_path(comment1.id)
    click_link "Delete"

    expect(page).to have_current_path(dance_path(comment1.dance))
    expect(page).not_to have_content(comment1.comment)
  end

  pending 'dance_creator sucessfully delete a dance_comment from the dance path' do
    sign_in dance.user
    visit dance_path(comment2.dance)
    click_link "Delete"

    expect(page).to have_current_path(edit_dance_comment_path(comment2))
  end

  pending 'dance_creator sucessfully delete a dance_comment from the dance_comments path' do
    sign_in dance.user
    visit dance_comments_path
    click_link "Delete"

    expect(page).to have_current_path(edit_dance_comment_path(comment1))
  end
end
