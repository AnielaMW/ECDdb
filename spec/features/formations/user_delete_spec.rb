require 'rails_helper'

feature 'delete a formation', %Q{
  As an Admin User
  I want to delete formations
  So I can delete formations.
  } do
  # Acceptance
  # User cannot delete formations unless user is signed-in
  # User cannot delete formations unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:formation1) { FactoryGirl.create(:formation, user_id: anne.id) }
  let!(:clay) { FactoryGirl.create(:anne) }

  scenario 'sucessfully delete a formation when authenticated user' do
    sign_in anne
    visit formation_path(formation1.id)
    click_link "Delete"

    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content(formation1.title)
  end

  scenario 'fail to see "Delete" button with unauthenticated user' do
    visit formation_path(formation1.id)
    expect(page).not_to have_content("Delete")
  end

  scenario 'fail to see "Delete" button
    if authenticated user is not the creator' do
    sign_in clay
    visit formation_path(formation1.id)
    expect(page).not_to have_content("Delete")
  end
end
