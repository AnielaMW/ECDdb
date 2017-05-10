require 'rails_helper'

feature 'view dance directions', %{
  As a Guest
  I want to view the dance page and see it's directions
  So I can see all dance_directions for a dance.
  } do
  # Acceptance
  # When a guest visits a dance
  # they should expect to see a list of all dance_directions
  # The list should be sorted by sequence
  # The dance_directions#index should list all directions for a given dance
  # The list should be sorted by sequence
  # The list should include the sequence and direction
  # The list may include the mark, measure, and layout if provided

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:dir1) { FactoryGirl.create(:dod, dance_id: dance.id) }
  let!(:dir2) { FactoryGirl.create(:dance_direction, dance_id: dance.id) }
  let!(:dir3) { FactoryGirl.create(:dance_direction, dance_id: dance.id) }
  let!(:dir4) { FactoryGirl.create(:dance_direction) }

  pending 'sucessfully view the dance_directions for a given dance' do
    visit dance_path(dance)

    directions = page.all("article.direction-box")

    expect(directions[0]).to have_content(dir3.direction)
    expect(directions[0]).to have_content(dir3.user.first_name)
    expect(directions[0]).to have_content(dir3.direction_type.name)

    expect(directions[1]).to have_content(dir2.direction)
    expect(directions[1]).to have_content(dir2.user.first_name)
    expect(directions[1]).to have_content(dir2.direction_type.name)

    expect(directions[2]).to have_content(dir1.direction)
    expect(directions[2]).to have_content(dir1.user.first_name)
    expect(directions[2]).to have_content(dir1.direction_type.name)
  end

  pending 'sucessfully view the dance_directions for all dances on
  dance_direction#index' do
    visit dance_directions_path

    directions = page.all("article.direction-box")

    expect(directions[0]).to have_content(dir4.dance.title)
    expect(directions[0]).to have_content(dir4.direction)
    expect(directions[0]).to have_content(dir4.user.first_name)
    expect(directions[0]).to have_content(dir4.direction_type.name)

    expect(directions[1]).to have_content(dir3.dance.title)
    expect(directions[1]).to have_content(dir3.direction)
    expect(directions[1]).to have_content(dir3.user.first_name)
    expect(directions[1]).to have_content(dir3.direction_type.name)

    expect(directions[2]).to have_content(dir2.dance.title)
    expect(directions[2]).to have_content(dir2.direction)
    expect(directions[2]).to have_content(dir2.user.first_name)
    expect(directions[2]).to have_content(dir2.direction_type.name)

    expect(directions[3]).to have_content(dir1.dance.title)
    expect(directions[3]).to have_content(dir1.direction)
    expect(directions[3]).to have_content(dir1.user.first_name)
    expect(directions[3]).to have_content(dir1.direction_type.name)
  end
end
