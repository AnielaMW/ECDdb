FactoryGirl.define do
  factory :dance do
    user
    sequence(:title) { |n| "Aniela's #{n}" }
    sequence(:direction) { |n| "#{n} couple set, turn single" }
    meter
    formation

    factory :authored_dance, aliases: [:authored] do
      sequence(:author) { |n| "Dance Master#{n}" }
      sequence(:year) { |n| "178#{n}" }
      sequence(:publication) { |n| "Dance Book vol. #{n}" }
    end
  end
end
