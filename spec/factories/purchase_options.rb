FactoryBot.define do
  factory :purchase_option do
    price { "9.99" }
    video_quality { "MyString" }
    purchasable { nil }
  end
end
