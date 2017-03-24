require 'rails_helper'

feature 'view dances#show', %Q{
  As a Guest
  I want to view the dances#show
  So I can get all information about a dance.
  } do
  # Acceptance
  # When a guest visits a dance#show_path, they should expect to see all details of a dance
  # When a guest clicks on a link from the #root_path, they should expect to see all details of a dance
  # When a guest clicks on a link from the dances#index_path, they should expect to see all details of a dance
  # Details must include Creator(User), Title, Formation, Meter, Dance_Instructions
  # Details may include Author, Year, Publication

  pending 'sucessfully view a dance#show when entered directly'

  pending 'sucessfully view a dance#show from dances#index_path'

  pending 'sucessfully view a dance#show from root_path'
end
