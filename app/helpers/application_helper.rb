module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def last_registered_users
    @last_registered_users = User.last(5)
  end

  def alert_string(alert)
    alert.is_a?(Array) ? safe_join(alert, "<br />".html_safe) : alert
  end
end