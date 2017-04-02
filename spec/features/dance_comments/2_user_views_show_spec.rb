require 'rails_helper'

feature 'view dance_comments#show', %Q{
  As a Guest
  I want to view the dance_comments#show
  So I can get all information about a comment.
  } do
  # Acceptance
  # When a guest visits a dance_comments#show_path,
  # they should expect to see all details of a dance_comment
  # When a guest clicks on a link from the dance_path,
  # they should expect to see all details of a dance_comment
  # Details must include Creator(User),
  #   Comment, Dance.name, Comment_Type

  let!(:comment1) { FactoryGirl.create(:dance_comment) }

  pending 'sucessfully view a dance_comment#show when entered directly' do
    visit dance_comment_path(comment1.id)

    expect(page).to have_content(comment1.comment)
    expect(page).to have_content(comment1.user.first_name)
    expect(page).to have_content(comment1.dance.title)
    expect(page).to have_content(comment1.comment_type.name)
  end

  pending 'sucessfully view a dance_comments#show from dance_path' do
    visit dance_path(comment1)
    click_link comment1.comment.to_s

    expect(page).to have_current_path(dance_comment_path(comment1.id))
    expect(page).to have_content(comment1.comment)
    expect(page).to have_content(comment1.user.first_name)
    expect(page).to have_content(comment1.dance.title)
    expect(page).to have_content(comment1.comment_type.name)
  end
end
