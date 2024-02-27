# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Quote.fortune_cookie }
    cover_url { Faker::Internet.url }

    trait :valid_title do
      title { 'Titulo do livro' }
    end
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :reservation do
    association :user, factory: :user
    association :book, factory: :book
    returned_on { nil }

    trait :returned do
      returned_on { Date.today }
    end
  end
end
