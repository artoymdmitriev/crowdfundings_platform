module ProjectsHelper
  def last_projects
    Project.includes(:payments).last(3)
  end

  def last_successful_projects
    Project.includes(:payments).where(state: :succeeded).last(3)
  end

  def users_projects
    current_user.projects
  end

  def count_money_pledged project
    @donations = 0
    Payment.select(:amount).where(project_id: project.id) do |p|
      @donations += p.amount
    end
    return @donations
  end

  def user_name_and_surname project
    application = Application.find_by_user_id(project.user_id)
    return application.name + ' ' + application.surname
  end

  def kramdown text
    sanitize Kramdown::Document.new(text).to_html
  end

  def check_for_rights
    !current_user.nil? && (@project.user_id == current_user.id || current_user.role == 'admin') ? true : false
  end

  def active_goals
    Goal.where(project_id: @project.id, is_achieved: false)
  end

  def achieved_goals
    Goal.where(project_id: @project.id, is_achieved: true)
  end

  def earned_money project
    # TODO: do in ruby
    project.payments.sum &:amount
  end

  def subscribed?
    current_user.nil? || @project.subscriptions.where(user_id: current_user.id).empty? ? false : true
  end
end
