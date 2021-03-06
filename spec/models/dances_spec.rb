require 'rails_helper'

RSpec.describe Dance, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:dance_level) }
  it { should belong_to(:formation) }
  it { should belong_to(:key) }
  it { should belong_to(:meter) }
  it { should belong_to(:tempo) }
  it { should have_many(:dance_comments) }
  it { should have_many(:dance_directions) }
  # it { should have_many(:moods) }

  it { should validate_presence_of(:title) }
  it { should_not have_valid(:title).when('') }

  it { should validate_presence_of(:formation_id) }
  it { should_not have_valid(:formation_id).when('') }

  it { should validate_presence_of(:meter_id) }
  it { should_not have_valid(:meter_id).when('') }
end
