require "rails_helper"
RSpec.describe NoticeMailer, type: :mailer do
  let(:blog){Blog.create(id: 1, title: 'test', content: 'test-content')}
  it 'Jobがエンキューされたか' do
    expect {
      NoticeMailer.sendmail_blog(blog).deliver_later
    }.to have_enqueued_job(ActionMailer::DeliveryJob)
  end
end
