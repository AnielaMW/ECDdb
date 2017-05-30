FactoryGirl.define do
  factory :dance do
    user
    sequence(:title) { |n| "Dance Title #{n}" }
    meter
    formation

    factory :choreographered_dance, aliases: [:choreographered] do
      sequence(:choreographer) { |n| "Choreographer #{n}" }
      sequence(:year) { |n| "177#{n}" }
      sequence(:publication) { |n| "Publication #{n}" }
    end
  end
end
