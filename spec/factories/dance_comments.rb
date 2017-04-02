FactoryGirl.define do
  factory :dance_comment do
    sequence(:comment) { |n| "#{n}" }
    dance
    user

    factory :dcom_comment do
      comment_type
    end

    factory :dvar_comment do
      variation
    end

    factory :dstyle_comment do
      style_point
    end
  end
end
