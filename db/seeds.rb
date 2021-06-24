# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  username: "管理者",
  email: "admin@example.jp" ,
  password: "password",
  admin: true
 )

# start_time = Faker::Date.between(from: Date.tomorrow, to: 7.days.since)
# status = ["0","1"]
# 10.times do |n|
#   User.create!(
#     username: "User_name#{n + 1}",
#     email: "User_email#{n + 1}@sample.com" ,
#     password: "password",
#     admin: false
#    )
  # Work.create!(
  #   title: "Work_title#{n + 1}",
  #   content: "Work_content#{n + 1}",
  #   start_time: start_time,
  #   status: rand(0..1),
  #   remarks:" Work_remarks#{n + 1}",
  #   user_id: rand(User.first.id..User.last.id)
  # )
  # Team.create!(
  #   name: "Team_name#{n + 1}",
  #   user_id: rand(User.first.id..User.last.id)
  # )
  # Member.create!(
  #   team_id: rand(Team.first.id..Team.last.id),
  #   user_id: rand(User.first.id..User.last.id),
  # )
# end
