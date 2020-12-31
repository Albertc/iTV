# frozen_string_literal: true

FactoryBot.define do
  factory :purchasable_movie, class: 'PurchaseOption' do
    association :purchasable, factory: :movie

    trait :sd do
      price { 3.99 }
      video_quality { 'SD' }
    end

    trait :hd do
      price { 4.99 }
      video_quality { 'HD' }
    end
  end

  factory :purchasable_season, class: 'PurchaseOption' do
    association :purchasable, factory: %i[season with_3_episodes]

    trait :sd do
      price { 13.99 }
      video_quality { 'SD' }
    end

    trait :hd do
      price { 34.99 }
      video_quality { 'HD' }
    end
  end
end
