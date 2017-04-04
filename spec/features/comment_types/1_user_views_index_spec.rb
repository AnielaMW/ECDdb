require 'rails_helper'

feature 'view comment_types#index', %{
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

  let!(:type1) { FactoryGirl.create(:variation) }
  let!(:type2) { FactoryGirl.create(:comment_type) }
  let!(:type3) { FactoryGirl.create(:style_point) }
  let!(:dance) { FactoryGirl.create(:dance) }

  scenario 'sucessfully view the comment_types#index' do
    visit comment_types_path

    comment_types = page.all("div#comment_typelist ul li")

    expect(comment_types[0]).to have_content(type2.name)
    expect(comment_types[1]).to have_content(type3.name)
    expect(comment_types[2]).to have_content(type1.name)
  end

  scenario 'sucessfully view the comment_types#index after click on
  the comment form view button' do
    sign_in dance.user
    visit new_dance_dance_comment_path(dance)
    click_link "View Types"

    expect(page).to have_current_path(comment_types_path)

    # IN A POPUP WINDOW MAYBE WHEN ? ICON IS CLICKED INSTEAD OF
    # "VIEW TYPES"
  end
end
