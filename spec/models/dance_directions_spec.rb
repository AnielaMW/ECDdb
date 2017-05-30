require 'rails_helper'

RSpec.describe DanceDirection, type: :model do
  it { should belong_to(:dance) }

  it { should validate_presence_of(:sequence) }
  it { should_not have_valid(:sequence).when('') }

  it { should validate_presence_of(:direction) }
  it { should_not have_valid(:direction).when('') }
end
