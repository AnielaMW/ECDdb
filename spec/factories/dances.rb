FactoryGirl.define do
  factory :dance do
    user
    sequence(:title) { |n| "Dance Title #{n}" }
    meter
    formation

    factory :authored_dance, aliases: [:authored] do
      sequence(:author) { |n| "Author #{n}" }
      sequence(:year) { |n| "177#{n}" }
      sequence(:publication) { |n| "Publication #{n}" }
    end
  end
end
