module ProjectsHelper
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
end
