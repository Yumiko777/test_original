FactoryBot.define do
  factory :user do
    id { 1 }
    username { 'テストユーザー1' }
    email { 'test01@example.com' }
    password { 'password01' }
    password_confirmation { 'password01' }
    admin { false }
  end

  factory :user2, class: User do
    id { 2 }
    username { 'テストユーザー2' }
    email { 'test02@example.com' }
    password { 'password02' }
    password_confirmation { 'password02' }
    admin { false }
  end

  factory :user3, class: User do
    id { 3 }
    username { 'テストユーザー3' }
    email { 'test03@example.com' }
    password { 'password03' }
    password_confirmation { 'password03' }
    admin { false }
  end

  factory :admin, class: User do
    id { 4 }
    username { 'テストアドミン' }
    email { 'test04@example.com' }
    password { 'password04' }
    password_confirmation { 'password04' }
    admin { true }
  end
end
