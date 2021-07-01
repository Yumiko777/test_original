FactoryBot.define do
  factory :work do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    start_time { Date.current }
    status { 'false' }
    remarks { 'Factoryで作ったデフォルトの備考１' }
    association :user
  end

  factory :work2, class: Work do
    title { 'Factoryで作ったデフォルトのタイトル2' }
    content { 'Factoryで作ったデフォルトのコンテント2' }
    start_time { Date.yesterday }
    status { 'true' }
    remarks { 'Factoryで作ったデフォルトの備考2' }
    association :user
  end
end
