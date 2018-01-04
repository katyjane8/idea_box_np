FactoryBot.define do
  factory :category do
    sequence(:title) {|n|"awesome idea#{n}"}
  end
end
