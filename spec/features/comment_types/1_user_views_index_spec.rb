require 'rails_helper'

feature 'view comment_types#index', %Q{
  As a Guest
  I want to view the comment_types#index
  So I can pick from all comment_types.
  } do
  # Acceptance
  # When a guest visits the comment_types#index_path,
  # they should expect to see a list of all comment_types
  # When a guest clicks the view button on the comment form,
  # they should expect to see a list of all comment_types
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:type1) { FactoryGirl.create(:comment_type, name: "Variation") }
  let!(:type2) { FactoryGirl.create(:comment_type, name: "Comment") }
  let!(:type3) { FactoryGirl.create(:comment_type, name: "Style Point") }

  scenario 'sucessfully view the comment_types#index' do
    visit comment_types_path

    comment_types = page.all("div#comment_typelist ul li")

    expect(comment_types[0]).to have_content(type2.name)
    expect(comment_types[1]).to have_content(type3.name)
    expect(comment_types[2]).to have_content(type1.name)
  end

  pending 'sucessfully view the comment_types#index after click on
  the comment form view button' do
    visit new_comment_path
    click "View Comment Types"

    expect(page).to have_current_path(comment_types_path)
    expect(page).to have_content(type1.name)
    expect(page).to have_content(type2.name)
    expect(page).to have_content(type3.name)
  end
end
