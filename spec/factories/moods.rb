FactoryGirl.define do
  factory :mood do
    sequence(:name) { |n| "Mood #{n}" }
    description "Mood Description."
  end
end
