module ApplicationsHelper
  def check_application_existence user
    Application.exists?(user_id: user.id) ? true : false
  end

  def create_notification application
    Notification.create(user_id: application.user_id,
                        message: create_application_message(application.is_confirmed))
  end

  # TODO replace with translations
  def create_application_message bool_val
    bool_val ? 'Your account was confirmed' : 'Your account didn\'t pass confirmation'
  end
end