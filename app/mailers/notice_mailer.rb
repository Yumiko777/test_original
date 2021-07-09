class NoticeMailer < ApplicationMailer
  default from: 'admin@example.jp'
  def sendmail_blog(blog)
    @blog = blog
    mail to: @blog.user.email, subject: 'コメント新規投稿'
  end
end
