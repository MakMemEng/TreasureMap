FactoryBot.define do
  factory :comment do
    association :affirmation
    user { affirmation.user }
    comment { "MyComment" }
  end
end
