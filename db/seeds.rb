# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  username: "管理者用",
  email: "admin@example.jp" ,
  password: "password01",
  admin: true,
  uid: uid = SecureRandom.uuid
 )
User.create!(
  username: "佐藤太郎",
  email: "satou@example.jp" ,
  password: "password02",
  admin: false,
  uid: uid = SecureRandom.uuid
)
User.create!(
  username: "高橋次郎",
  email: "takahashi@example.jp" ,
  password: "password03",
  admin: false,
  uid: uid = SecureRandom.uuid
 )
User.create!(
  username: "小林三郎",
  email: "kobayashi@example.jp" ,
  password: "password04",
  admin: false,
  uid: uid = SecureRandom.uuid
)
User.create!(
  username: "森愛",
  email: "mori@example.jp" ,
  password: "password05",
  admin: false,
  uid: uid = SecureRandom.uuid
)

Work.create!(
  title: "営業",
  content: "営業A社訪問",
  start_time: Faker::Date.between(from: Date.tomorrow, to: 7.days.since),
  status: 0,
  remarks:" 最寄駅 名古屋駅",
  user_id: 2
)
Work.create!(
  title: "営業",
  content: "営業B社訪問",
  start_time: Faker::Date.between(from: Date.tomorrow, to: 7.days.since),
  status: 0,
  remarks:" 最寄駅 岐阜駅",
  user_id: 2
)
Work.create!(
  title: "営業",
  content: "営業C社訪問",
  start_time: Faker::Date.between(from: Date.tomorrow, to: 7.days.since),
  status: 0,
  remarks:" 最寄駅 浜松駅",
  user_id: 2
)
Work.create!(
  title: "経理",
  content: "A社振込",
  start_time: Faker::Date.between(from: Date.tomorrow, to: 7.days.since),
  status: 0,
  remarks:" 午前中に振込処理",
  user_id: 5
)
Work.create!(
  title: "経理",
  content: "B社振込",
  start_time: Faker::Date.between(from: Date.tomorrow, to: 7.days.since),
  status: 0,
  remarks:" 午前中に振込処理",
  user_id: 5
)

Team.create!(
  name: "チームA",
  user_id: 1
)
Team.create!(
  name: "チームB",
  user_id: 2
)
Team.create!(
  name: "チームC",
  user_id: 4
)

Member.create!(
  team_id: 1,
  user_id: 1
)
Member.create!(
  team_id: 2,
  user_id: 2
)
Member.create!(
  team_id: 2,
  user_id: 3
)
Member.create!(
  team_id: 3,
  user_id: 4
)
Member.create!(
  team_id: 3,
  user_id: 5
)

Blog.create!(
  title: "懇親会の日程調整",
  content: "親睦を深めるために懇親会を開催します。来週の金曜日はいかがでしょうか？",
  user_id: 1
)
Blog.create!(
  title: "会議の連絡事項",
  content: "本日14時からの会議は、会議室1でお願いいたします。",
  user_id: 2
)
Blog.create!(
  title: "本日は早帰り日のため定時退社を",
  content: "本日は早帰り日のため、遅くとも18時までに退社をお願いいたします。",
  user_id: 5
)
Blog.create!(
  title: "献血のご案内",
  content: "来週水曜日14時から献血バスが来ます。献血にご協力いただける方はよろしくお願いいたします。",
  user_id: 1
)

Comment.create!(
  blog_id: 1,
  user_id: 2,
  content: "参加します!"
)
Comment.create!(
  blog_id: 1,
  user_id: 5,
  content: "すみません、予定があるため欠席します"
)
Comment.create!(
  blog_id: 2,
  user_id: 3,
  content: "連絡ありがとうございます!"
)
Comment.create!(
  blog_id: 3,
  user_id: 4,
  content: "周知連絡ありがとうございます!定時退社目指して本日も頑張ります。"
)
Comment.create!(
  blog_id: 4,
  user_id: 2,
  content: "了解です!"
)

Business.create!(
  title: "勤怠管理",
  status: 0,
  user_id: 1
)
Business.create!(
  title: "勤怠管理",
  status: 0,
  user_id: 2
)
Business.create!(
  title: "勤怠管理",
  status: 0,
  user_id: 3
)
Business.create!(
  title: "勤怠管理",
  status: 0,
  user_id: 4
)
Business.create!(
  title: "勤怠管理",
  status: 0,
  user_id: 5
)
