FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Quote.fortune_cookie }
    cover_url { Faker::Internet.url }

    trait :valid_title do
      title { 'Titulo do livro' }
    end
  end
  end
