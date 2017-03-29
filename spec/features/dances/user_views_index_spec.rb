require 'rails_helper'

feature 'view dances#index', %Q{
  As a Guest
  I want to view the dances#index
  So I can pick from all dances from the genre.
  } do
  # Acceptance
  # When a guest visits the dances#index_path,
  # they should expect to see a list of all dances
  # The list should be sorted alphabetically by Title
  # The list should include the Dance Title

  let!(:dance1) { FactoryGirl.create(:dance) }
  let!(:dance2) { FactoryGirl.create(:dance) }
  let!(:dance3) { FactoryGirl.create(:authored) }

  scenario 'sucessfully view the dances#index' do
    visit dances_path

    expect(page).to have_content(dance1.title)
    expect(page).to have_content(dance2.title)
    expect(page).to have_content(dance3.title)
  end
end
