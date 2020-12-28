FactoryBot.define do
  factory :season do
    number { 1 }

    trait :with_3_episodes do
      after :create do |season|
        create_list :epidose, 3, season: season
      end
    end
  end
end
