FactoryBot.define do
  factory :episode do
    sequence(:title) { |seq| "Episode num. #{seq}" }
    sequence(:plot) { |seq| "Plot of the episode" }
    sequence(:number) { |seq| seq }

    trait :with_season do
      season
    end
  end
end
