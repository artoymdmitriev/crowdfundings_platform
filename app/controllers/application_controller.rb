class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :blocked?
  before_action :set_locale
  before_action :set_theme
  before_action :check_notifications

  def blocked?
    if !current_user.nil? && current_user.present? && current_user.is_blocked?
      sign_out current_user
      flash[:error] = "This account has been blocked..."
    end
  end

  private
  def set_locale
    if language_change_necessary?
      I18n.locale = the_new_locale
      set_locale_cookie(I18n.locale)
    else
      use_locale_from_cookie
    end
  end

  def language_change_necessary?
    return cookies['locale'].nil? || params[:locale]
  end

  def the_new_locale
    new_locale = (params[:locale])
    ['en', 'ru'].include?(new_locale) ? new_locale : I18n.default_locale.to_s
  end

  def set_locale_cookie(locale)
    cookies['locale'] = locale.to_s
  end

  def use_locale_from_cookie
    I18n.locale = cookies['locale']
  end

  def extract_locale_from_accept_language_header
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue I18n.default_locale
  end

  def set_theme
    if theme_change_necessary?
      @theme = the_new_theme
      set_theme_cookie(@theme)
    else
      use_theme_from_cookie
    end
  end

  def theme_change_necessary?
    return cookies['theme'].nil? || params[:theme]
  end

  def the_new_theme
    new_theme = (params[:theme] || 'application_light')
  end

  def set_theme_cookie(theme)
    cookies['theme'] = theme.to_s
  end

  def use_theme_from_cookie
    @theme = cookies['theme']
  end
end
