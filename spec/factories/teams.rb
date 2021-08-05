FactoryBot.define do
  factory :team do
    name { 'テストチーム1' }
  end

  factory :team2, class: Team do
    name { 'テストチーム2' }
  end
end
