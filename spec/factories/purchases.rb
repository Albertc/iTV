# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    user { User.first || association(:user) }
    # user

    factory :movie_purchase do
      association :purchase_option, factory: %i[purchasable_movie sd]
    end

    factory :expired_purchase do
      association :purchase_option, factory: %i[purchasable_movie hd]
      expired_at { Date.yesterday }
    end

    factory :season_purchase do
      association :purchase_option, factory: %i[purchasable_season sd]
    end
  end
end
