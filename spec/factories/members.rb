FactoryBot.define do
  factory :member do
    association :team
    user { team.user }
  end
end
