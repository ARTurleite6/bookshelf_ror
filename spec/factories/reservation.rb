FactoryBot.define do
  factory :reservation do
    association :user, factory: :user
    association :book, factory: :book
    returned_on { nil }

    trait :returned do
      returned_on { Date.today }
    end
  end
end
