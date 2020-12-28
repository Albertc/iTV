FactoryBot.define do
  factory :episode do
    sequence(:title) { |seq| "Episode title #{seq}" }
    sequence(:plot) { |seq| "Episode plot #{seq}" }
    sequence(:number) { |seq| seq }
  end
end
