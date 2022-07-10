# frozen_string_literal: true

# Factory for Drop
FactoryBot.define do
  factory :drop do
    description { Faker::Hacker.verb }
    content     { Faker::Hacker.say_something_smart }
  end
end
