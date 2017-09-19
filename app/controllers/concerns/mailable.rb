module Mailable include ActiveSupport::Concern
  def mail news_item
    get_subscrubers(news_item).each do |email_address|
      NewsMailer.news_item_notification(news_item, email_address).deliver_later
    end
  end

  def get_subscrubers news_item
    email_addresses = []
    news_item.project.subscriptions.each do |s|
      email_addresses << s.user.email
    end
    return email_addresses
  end
end