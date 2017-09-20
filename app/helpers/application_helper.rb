module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { sort: column, direction: direction}, {class: css_class}
  end

  def alert_string(alert)
    alert.is_a?(Array) ? safe_join(alert, "<br />".html_safe) : alert
  end

  #TODO refactor
  def check_notifications
    @notifications = []
    @notifications = Notification.where(user_id: current_user.id, is_shown: false) if current_user
    @notifications.each do |notification|
      flash[:info] = notification.message
      notification.update(is_shown: true)
    end
  end
end