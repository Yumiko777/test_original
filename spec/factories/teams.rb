FactoryBot.define do
  factory :team do
    name { 'テストチーム1' }
    association :user
  end

  factory :second_team, class: Team do
    name { 'テストチーム2' }
    association :user
  end
end
