require 'rails_helper'

feature 'view moods#show', %{
  As a Guest
  I want to view the moods#show
  So I can get all information about a mood.
  } do
  # Acceptance
  # When a guest visits a mood#show_path,
  # they should expect to see all details of a mood
  # When a guest clicks on a link from the moods#index_path,
  # they should expect to see all details of a mood
  # Details must include Name and Description

  let!(:mood) { FactoryGirl.create(:mood) }
  # let!(:dance) { FactoryGirl.create(:dance, mood_id: mood.id) }

  scenario 'sucessfully view a mood#show when entered directly' do
    visit mood_path(mood.id)

    expect(page).to have_content(mood.name)
    expect(page).to have_content(mood.description)
  end

  scenario 'sucessfully view a mood#show from moods#index_path or
  dance_path' do
    visit moods_path
    click_link mood.name

    expect(page).to have_current_path(mood_path(mood.id))

    # visit dance_path(dance)
    # click_link mood.name
    #
    # expect(page).to have_current_path(mood_path(mood.id))

    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
