class NewsMailer < ApplicationMailer
  default from: "no-reply@crowdfunding-platform.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.news_mailer.news_item_notification.subject
  #
  def news_item_notification(news_item, email_address)
    @news_item = news_item
    mail to: email_address, subject: "News Item posted."
  end
end
