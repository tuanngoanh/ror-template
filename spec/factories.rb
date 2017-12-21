FactoryBot.define do
  factory :country do
    sequence(:name)        { |n| "Country #{n}" }
  end

  factory :state do
    sequence(:abbr)         { |n| "st#{n}" }
    sequence(:name)         { |n| "State #{n}" }
    country
  end

  factory :time_zone do
    name 'America/Los_Angeles'
  end

  factory :airport do
    name Faker::Name.name
    code ('a'..'z').to_a.shuffle.first(3).join
    time_zone
    city 'SFO'
    country
    state
  end
end