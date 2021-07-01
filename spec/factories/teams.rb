FactoryBot.define do
  factory :team do
    name { 'テストチーム1' }
    association :user
  end

  factory :team2, class: Team do
    name { 'テストチーム2' }
    association :user
  end
end
