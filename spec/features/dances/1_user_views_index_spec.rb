require 'rails_helper'

feature 'view dances#index', %{
  As a Guest
  I want to view the dances#index
  So I can pick from all dances from the genre.
  } do
  # Acceptance
  # When a guest visits the dances#index_path,
  # they should expect to see a list of all dances
  # The list should be sorted alphabetically by Title
  # The list should include the Dance Title, Creator, Author(if any),
  # year(if any)

  let!(:dance1) { FactoryGirl.create(:dance, title: "Zelda's Waltz") }
  let!(:dance2) { FactoryGirl.create(:dance, title: "Link's Jig") }
  let!(:dance3) { FactoryGirl.create(:authored, title: "Mario's Maggot") }

  scenario 'sucessfully view the dances#index' do
    visit dances_path

    dances = page.all("article.dance-box")

    expect(dances[0]).to have_content(dance2.title)
    expect(dances[0]).to have_content(dance2.user.first_name)
    expect(dances[0]).not_to have_content("Authored by: ")
    expect(dances[1]).to have_content(dance3.title)
    expect(dances[1]).to have_content(dance3.user.first_name)
    expect(dances[1]).to have_content(dance3.author)
    expect(dances[1]).to have_content(dance3.year)
    expect(dances[2]).to have_content(dance1.title)
    expect(dances[2]).to have_content(dance1.user.first_name)
    expect(dances[2]).not_to have_content("Authored by: ")
  end
end
