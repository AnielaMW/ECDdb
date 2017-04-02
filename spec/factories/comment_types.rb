FactoryGirl.define do
  factory :comment_type do
    name "Comment"
    sequence(:description) { |n| "#{n}" }

    factory :variation do
      name "Variation"
    end

    factory :style_point do
      name "Style Point"
    end
  end
end
