require "rails_helper"

feature "sign_in to account", %Q{
  As a user
  I want to sign in to my account
  So that I cen be signed-in
  } do

    # ACCEPTANCE CRITERIA
    # * User provide email
    # * User provide password
    # * If information is incomplete, User gets error message.
    # * If information is invalid, User gets error message.

  pending "sucessfully sign_in when user enters valid information"

  pending "fails to sign_in when user enters incomplete information"

  pending "fails to sign_in when user enters invalid email"

  pending "fails to sign_in when user enters invalid password"
end
