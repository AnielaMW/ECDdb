require 'rails_helper'

feature 'view index', %Q{
  As a Guest
  I want to view the dance_comments#index
  So I can see from all dance_comments for a dance.
  } do
  # Acceptance
  # When a guest visits a dance
  # they should expect to see a list of all dance_comments
  # The list should be sorted alphabetically by comment_type
  # The list should include the comment_type, user, and comment

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:comment1) { FactoryGirl.create(:dcom_comment, dance_id: dance.id) }
  let!(:comment2) { FactoryGirl.create(:dvar_comment, dance_id: dance) }
  let!(:comment3) { FactoryGirl.create(:dstyle_comment, dance_id: dance) }

  pending 'sucessfully view the dance_comments for a given dance' do
    visit dance_path(dance)

    dance_comments = page.all("div#dance_commentlist ul li")

    expect(dance_comments[0]).to have_content(dance_comment1.comment)
    expect(dance_comments[1]).to have_content(dance_comment3.comment)
    expect(dance_comments[2]).to have_content(dance_comment2.comment)
  end
end
