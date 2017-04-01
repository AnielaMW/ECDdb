require 'rails_helper'

feature 'view formations#index', %Q{
  As a Guest
  I want to view the formations#index
  So I can pick from all formations.
  } do
  # Acceptance
  # When a guest visits the formations#index_path,
  # they should expect to see a list of all formations
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:formation1) { FactoryGirl.create(:formation, name: "2 Couple") }
  let!(:formation2) { FactoryGirl.create(:formation, name: "Scicilian Circle") }
  let!(:formation3) { FactoryGirl.create(:formation, name: "4 Couple 1st and 3rd Improper") }

  scenario 'sucessfully view the formations#index' do
    visit formations_path

    formations = page.all("div#formationlist ul li")

    expect(formations[0]).to have_content(formation1.name)
    expect(formations[1]).to have_content(formation3.name)
    expect(formations[2]).to have_content(formation2.name)
  end
end
