FactoryBot.define do
  factory :purchase do
    expired_t { "2020-12-28" }
    user { nil }
    purchase_option { nil }
  end
end
