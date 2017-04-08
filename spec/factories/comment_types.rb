FactoryGirl.define do
  factory :comment_type do
    sequence(:name) { |n| "Comment #{n}" }
    description "Comment Description"

    factory :variation, class: CommentType do
      name "Variation"
    end

    factory :style_point, class: CommentType do
      name "Style Point"
    end
  end
end
