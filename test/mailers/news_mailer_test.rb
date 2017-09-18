require 'test_helper'

class NewsMailerTest < ActionMailer::TestCase
  test "news_item_notification" do
    mail = NewsMailer.news_item_notification
    assert_equal "News item notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
