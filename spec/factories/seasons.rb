FactoryBot.define do
  factory :season do
    title { 'Season title'}
    plot { 'Season plot'}
    sequence(:number) { |seq| seq }

    trait :with_3_episodes do
      after :create do |season|
        create_list :episode, 3, season: season
      end
    end
  end
end
