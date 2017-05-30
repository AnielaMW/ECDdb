FactoryGirl.define do
  factory :dance_direction, aliases: [:dd] do
    dance
    sequence(:sequence) { |n| "#{n}" }
    sequence(:direction) { |n| "two hand turn your partner #{n} times"}

    factory :opt_direction, aliases: [:dod] do
      sequence(:mark) { |n| "#{n}"}
      sequence(:measure) { |n| "#{n}"}
      sequence(:position) { |n| "m#{n}-w#{n}"}
    end
  end
end
