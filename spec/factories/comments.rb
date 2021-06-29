FactoryBot.define do
  factory :comment do
    id { 1 }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    association :blog
    user { blog.user }
  end
end
