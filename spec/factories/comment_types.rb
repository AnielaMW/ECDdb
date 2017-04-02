FactoryGirl.define do
  factory :comment_type do
    sequence(:name) { |n| "#{n}. Variation" }
    sequence(:description) { |n| "#{n * 2} name says it all." }
  end
end
