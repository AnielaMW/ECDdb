require "rails_helper"

feature "edits account", %Q{
  As an authenticated user
  I want to edit my account
  So that I can update my profile
  } do

    # ACCEPTANCE CRITERIA
    # * User can edit first_name
    # * User can edit last_name
    # * User can edit email
    # * If all information is complete, User is updated.
    # * If information is incomplete, User gets error message.

  pending "sucessfully update account when user enters valid information"

  pending "fails to update account when user enters invalid information"
end
