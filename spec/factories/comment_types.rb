FactoryGirl.define do
  factory :comment_type do
    sequence(:name) { |n| "Comment #{n}" }
    description "Comment Description"

    factory :variation do
      name "Variation"
    end

    factory :style_point do
      name "Style Point"
    end
  end
end
