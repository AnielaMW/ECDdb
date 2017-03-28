require 'rails_helper'

feature 'update a dance', %Q{
  As an Authenticated User
  I want to update my dances
  So I can edit dances I have created.
  } do
  # Acceptance
  # User cannot edit dances unless user is signed-in
  # User cannot edit dances unless they are the creator
  # User must povide Title, Formation, Meter, Dance_Instructions
  # User may provide Author, Year, Publication
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not the creator, they cannot see the 'Edit' button

  pending 'sucessfully update a dance when authenticated user provides valid information'

  pending 'sucessfully update a dance when authenticated user provides all information'

  pending 'fail to update a dance when authenticated user provides invalid information'

  pending 'fail to see "Edit" button with unauthenticated user'

  pending 'fail to see "Edit" button if authenticated user is not the creator'
end
