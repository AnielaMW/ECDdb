FactoryGirl.define do
  factory :user, aliases: [:anne] do
    sequence(:first_name) { |n| "Anne#{n}" }
    sequence(:last_name) { |n| "Elliot#{n}" }
    sequence(:email) { |n| "faithful#{n}@bath.uk" }
    sequence(:password) { |n| "fredrick#{n}" }

    factory :admin_user, aliases: [:admin] do
      sequence(:first_name) { |n| "Anne#{n}" }
      sequence(:last_name) { |n| "Elliot#{n}" }
      sequence(:email) { |n| "faithful#{n}@bath.uk" }
      sequence(:password) { |n| "fredrick#{n}" }
      admin true
    end
  end
end
