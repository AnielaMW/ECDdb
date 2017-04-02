FactoryGirl.define do
  factory :dance do
    user
    sequence(:title) { |n| "#{n}" }
    sequence(:direction) { |n| "#{n}" }
    meter
    formation

    factory :authored_dance, aliases: [:authored] do
      sequence(:author) { |n| "#{n}" }
      sequence(:year) { |n| "#{n}" }
      sequence(:publication) { |n| "#{n}" }
    end
  end
end
