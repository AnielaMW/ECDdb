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
  # The list may include the mark, measure, and position if provided

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:dir1) { FactoryGirl.create(:dod, dance_id: dance.id) }
  let!(:dir2) { FactoryGirl.create(:dance_direction, dance_id: dance.id) }
  let!(:dir3) { FactoryGirl.create(:dance_direction, dance_id: dance.id) }
  let!(:dir4) { FactoryGirl.create(:dance_direction) }

  scenario 'sucessfully view the dance_directions for a given dance' do
    visit dance_path(dance)

    dirT = page.all(".direction-row")

    expect(dirT[0]).to have_content(dir1.sequence)
    expect(dirT[0]).to have_content(dir1.direction)
    expect(dirT[1]).to have_content(dir2.sequence)
    expect(dirT[1]).to have_content(dir2.direction)
    expect(dirT[2]).to have_content(dir3.sequence)
    expect(dirT[2]).to have_content(dir3.direction)
    expect(dirT).not_to have_content(dir4.sequence)
    expect(dirT).not_to have_content(dir4.direction)
  end

  scenario 'sucessfully view the dance_directions with optional information' do
    visit dance_path(dir4.dance_id)

    dirT = page.all(".direction-row")

    expect(dirT[0]).to have_content(dir4.sequence)
    expect(dirT[0]).to have_content(dir4.direction)
    expect(dirT[0]).to have_content(dir4.mark)
    expect(dirT[0]).to have_content(dir4.measure)
    expect(dirT[0]).to have_content(dir4.position)
  end
end
