FactoryGirl.define do
  factory :meter do
    sequence(:name) { |n| "#{n}/16" }
    description "1/16th speed"
  end
end
