require 'rails_helper'

RSpec.describe Dance, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:formation) }
  it { should belong_to(:meter) }

  it { should validate_presence_of(:title) }
  it { should_not have_valid(:title).when('') }

  it { should validate_presence_of(:formation_id) }
  it { should_not have_valid(:formation_id).when('') }

  it { should validate_presence_of(:meter_id) }
  it { should_not have_valid(:meter_id).when('') }

  it { should validate_presence_of(:direction) }
  it { should_not have_valid(:direction).when('') }
end
