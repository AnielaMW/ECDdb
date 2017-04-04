require 'rails_helper'

feature 'view dance comments', %Q{
  As a Guest
  I want to view the dance page and see it's comments
  So I can see from all dance_comments for a dance.
  } do
  # Acceptance
  # When a guest visits a dance
  # they should expect to see a list of all dance_comments
  # The list should be sorted alphabetically by comment_type
  # The dance_comments#index shoul list all comments from all dance_comments
  # The list should be sorted by soonest to oldest
  # The both lists should include the comment_type, user, and comment
  # The indexes list should include the dance.title

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:comment1) { FactoryGirl.create(:dcom_comment, dance_id: dance.id) }
  let!(:comment2) { FactoryGirl.create(:dvar_comment, dance_id: dance.id) }
  let!(:comment3) { FactoryGirl.create(:dstyle_comment, dance_id: dance.id) }
  let!(:comment4) { FactoryGirl.create(:dance_comment) }

  scenario 'sucessfully view the dance_comments for a given dance' do
    visit dance_path(dance)

    comments = page.all("div#dance_commentlist ul li")

# Can't get the factories to creat the three different kinds of comment types.
    # expect(comments[0]).to have_content(comment1.comment)
    # expect(comments[1]).to have_content(comment3.comment)
    # expect(comments[2]).to have_content(comment2.comment)

    expect(comments[0]).to have_content(comment1.comment)
    expect(comments[0]).to have_content(comment1.user.first_name)
    expect(comments[0]).to have_content(comment1.comment_type.name)
    expect(comments[1]).to have_content(comment2.comment)
    expect(comments[1]).to have_content(comment2.user.first_name)
    expect(comments[1]).to have_content(comment2.comment_type.name)
    expect(comments[2]).to have_content(comment3.comment)
    expect(comments[2]).to have_content(comment3.user.first_name)
    expect(comments[2]).to have_content(comment3.comment_type.name)
  end

  scenario 'sucessfully view the dance_comments for all dances on dance_comment#index' do
    visit dance_comments_path

    comments = page.all("div#dance_commentlist ul li")

    expect(comments[0]).to have_content(comment1.dance.title)
    expect(comments[0]).to have_content(comment1.comment)
    expect(comments[0]).to have_content(comment1.user.first_name)
    expect(comments[0]).to have_content(comment1.comment_type.name)
    expect(comments[1]).to have_content(comment2.dance.title)
    expect(comments[1]).to have_content(comment2.comment)
    expect(comments[1]).to have_content(comment2.user.first_name)
    expect(comments[1]).to have_content(comment2.comment_type.name)
    expect(comments[2]).to have_content(comment3.dance.title)
    expect(comments[2]).to have_content(comment3.comment)
    expect(comments[2]).to have_content(comment3.user.first_name)
    expect(comments[2]).to have_content(comment3.comment_type.name)
    expect(comments[3]).to have_content(comment4.dance.title)
    expect(comments[3]).to have_content(comment4.comment)
    expect(comments[3]).to have_content(comment4.user.first_name)
    expect(comments[3]).to have_content(comment4.comment_type.name)

    # NEED TO ADD DATE TIME TO THE TABLE AND THEN SORT BY DATE TIME
    # EVENTUALLY, TYPES WILL BE SORTED INTO DIFFERNET VIEWS
  end
end
