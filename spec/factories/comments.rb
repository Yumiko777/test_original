FactoryBot.define do
  factory :comment do
    content { 'Factoryで作ったデフォルトのコンテント１' }
    association :blog
    user { blog.user }
  end
end
