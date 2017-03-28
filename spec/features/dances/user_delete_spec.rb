require 'rails_helper'

feature 'delete a dance', %Q{
  As an Authenticated User
  I want to delete my dances
  So I can delete dances I have created.
  } do
  # Acceptance
  # User cannot delete dances unless user is signed-in
  # User cannot delete dances unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  pending 'sucessfully delete a dance when authenticated user'

  pending 'fail to see "Delete" button with unauthenticated user'

  pending 'fail to see "Delete" button if authenticated user is not the creator'
end
