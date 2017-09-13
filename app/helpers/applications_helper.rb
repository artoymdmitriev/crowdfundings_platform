module ApplicationsHelper
  def check_application_existence user
    Application.exists?(user_id: user.id) ? true : false
  end
end