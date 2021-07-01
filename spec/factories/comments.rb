FactoryBot.define do
  factory :comment do
    content { 'おはよう' }
    # association :blog
    # user { blog.user }
  end
end
