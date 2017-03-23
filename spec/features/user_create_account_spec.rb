require "rails_helper"

feature "create account", %Q{
  As a User
  I want to create an account
  So that I can login
  } do
    # Acceptance
    # * User must specify first_name
    # * User must specify last_name
    # * User must specify email
    # * User must specify and confirm password.
    # * If all information is complete, User is registered and authenticated.
    # * If information is incomplete, User gets error message.

  pending "sucessfully create account when user enters valid information"

  pending "fails to create account when user enters invalid information"

  pending "fails to create account when user password and confirm password don't match"
end
