FactoryGirl.define do
  factory :meter do
    sequence(:name) { |n| "#{n}/16" }
    sequence(:description) { |n| "#{n}/16th speed" }
  end
end
