# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/news_mailer/news_item_notification
  def news_item_notification
    NewsMailer.news_item_notification
  end

end
