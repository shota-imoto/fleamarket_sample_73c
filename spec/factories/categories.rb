FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "name#{n}"}
    sequence(:ancestry) {|n| "name#{n}"}

    trait :with_category1 do
      sequence(:ancestry) {|n| "name#{n}"}
    end
  end
end