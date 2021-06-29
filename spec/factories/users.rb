FactoryBot.define do
  factory :user do
    username { 'テストユーザー1' }
    email { 'test01@example.com' }
    password { 'password01' }
    password_confirmation { 'password01' }
    admin { false }
  end

  factory :second_user, class: User do
    username { 'テストユーザー2' }
    email { 'test02@example.com' }
    password { 'password02' }
    password_confirmation { 'password02' }
    admin { true }
  end
end
