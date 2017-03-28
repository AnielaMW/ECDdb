require 'rails_helper'

feature 'create a dance', %Q{
  As an Authenticated User
  I want to create new dances
  So I can share dances with other users.
  } do
  # Acceptance
  # User cannot create new dances unless user is signed-in
  # User must povide Title, Formation, Meter, Dance_Instructions
  # User may provide Author, Year, Publication
  # If user is not signed-in and tries to create a new dance, they are redirected and prompted to sign-in

  pending 'sucessfully create a dance when authenticated user provides valid information'

  pending 'sucessfully create a dance when authenticated user provides all information'

  pending 'fail to create a dance when authenticated user provides invalid information'

  pending 'fail to create a dance with unauthenticated user'
end
