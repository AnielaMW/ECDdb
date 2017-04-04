require 'rails_helper'

feature 'view meters#show', %Q{
  As a Guest
  I want to view the meters#show
  So I can get all inmeter about a meter.
  } do
  # Acceptance
  # When a guest visits a meter#show_path,
  # they should expect to see all details of a meter
  # When a guest clicks on a link from the meters#index_path,
  # they should expect to see all details of a meter
  # Details must include Name and Description

  let!(:meter) { FactoryGirl.create(:meter) }
  let!(:dance) { FactoryGirl.create(:dance, meter_id: meter.id) }

  pending 'sucessfully view a meter#show when entered directly' do
    visit meter_path(meter.id)

    expect(page).to have_content(meter.name)
    expect(page).to have_content(meter.description)
  end

  pending 'sucessfully view a meter#show from meters#index_path' do
    visit meters_path
    click_link meter.name.to_s

    expect(page).to have_current_path(meter_path(meter.id))
    expect(page).to have_content(meter.name)
    expect(page).to have_content(meter.description)
  end

  pending 'sucessfully view a meter#show from a dance_path' do
    visit dance_path(dance)
    click_link meter.name.to_s

    expect(page).to have_current_path(meter_path(meter.id))
    expect(page).to have_content(meter.name)
    expect(page).to have_content(meter.description)
  end
end
