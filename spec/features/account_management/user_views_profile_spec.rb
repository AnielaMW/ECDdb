require 'rails_helper'

feature 'views account', %{
  As a user
  I want to view accounts
  So that I can see public profiles of users
  } do

  # ACCEPTANCE CRITERIA
  # * Clicking on a users name sitewide navigates to that users profile.
  # * User can view the first_name of users
  # * User cannot view the last_name, password, email of users
  # * click a link to thier comments and dances

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:fred) { FactoryGirl.create(:anne) }
  let!(:dance1) { FactoryGirl.create(:dance, user_id: fred.id) }
  let!(:com1) do
    FactoryGirl.create(:dvar_comment, user_id: fred.id, dance_id: dance1.id)
  end
  let!(:com2) { FactoryGirl.create(:dstyle_comment, user_id: fred.id) }

  scenario 'sucessfully view profile without dances or comments' do
    sign_in fred
    visit user_path(anne)

    expect(page).to have_content(anne.first_name)
    expect(page).not_to have_content(anne.last_name)
    expect(page).not_to have_content(anne.email)
    expect(page).not_to have_content(anne.password)
    expect(page).not_to have_content("Dances")
    expect(page).not_to have_content("Comments")
  end

  scenario 'sucessfully view profile with dances or comments' do
    sign_in anne
    visit user_path(fred)

    expect(page).to have_content(fred.first_name)
    expect(page).not_to have_content(fred.last_name)
    expect(page).not_to have_content(fred.email)
    expect(page).not_to have_content(fred.password)
    expect(page).to have_content(dance1.title)
    expect(page).to have_content(com1.comment)
    expect(page).to have_content(com2.comment)
  end
end
