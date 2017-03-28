require 'rails_helper'

feature 'view dances#show', %Q{
  As a Guest
  I want to view the dances#show
  So I can get all information about a dance.
  } do
  # Acceptance
  # When a guest visits a dance#show_path, they should expect to see all details of a dance
  # When a guest clicks on a link from the #root_path, they should expect to see all details of a dance
  # When a guest clicks on a link from the dances#index_path, they should expect to see all details of a dance
  # Details must include Creator(User), Title, Formation, Meter, Dance_Instructions
  # Details may include Author, Year, Publication

  let!(:dance1) { FactoryGirl.create(:dance) }
  let!(:dance2) { FactoryGirl.create(:authored) }

  scenario 'sucessfully view a dance#show when entered directly' do
    visit dance_path(dance1.id)

    expect(page).to have_content(dance1.title)
    expect(page).to have_content(dance1.user.first_name)
    expect(page).to have_content(dance1.formation.name)
    expect(page).to have_content(dance1.meter.name)
    expect(page).to have_content(dance1.direction)
  end

  scenario 'sucessfully view dance#show with all available information' do
    visit dance_path(dance2.id)

    expect(page).to have_content(dance2.title)
    expect(page).to have_content(dance2.user.first_name)
    expect(page).to have_content(dance2.formation.name)
    expect(page).to have_content(dance2.meter.name)
    expect(page).to have_content(dance2.author)
    expect(page).to have_content(dance2.publication)
    expect(page).to have_content(dance2.year)
    expect(page).to have_content(dance2.direction)
  end

  scenario 'sucessfully view a dance#show from dances#index_path' do
    visit dances_path
    click_link "#{dance1.title}"

    expect(page).to have_current_path(dance_path(dance1.id))
    expect(page).to have_content(dance1.title)
    expect(page).to have_content(dance1.user.first_name)
    expect(page).to have_content(dance1.formation.name)
    expect(page).to have_content(dance1.meter.name)
    expect(page).to have_content(dance1.direction)
  end

  scenario 'sucessfully view a dance#show from root_path' do
    visit root_path
    click_link "#{dance1.title}"

    expect(page).to have_current_path(dance_path(dance1.id))
    expect(page).to have_content(dance1.title)
    expect(page).to have_content(dance1.user.first_name)
    expect(page).to have_content(dance1.formation.name)
    expect(page).to have_content(dance1.meter.name)
    expect(page).to have_content(dance1.direction)
  end
end
