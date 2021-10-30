FactoryBot.define do
  factory :user do
    username { 'nagami' }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
