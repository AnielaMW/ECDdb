FactoryGirl.define do
  factory :formation do
    sequence(:name) { |n| "#{n} couple set" }
    sequence(:description) { |n| "#{n * 2} people in two lines" }
  end
end
