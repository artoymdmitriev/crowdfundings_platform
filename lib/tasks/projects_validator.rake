namespace :validation_tasks do
  desc "Validates if project failed or succeeded"
  task :validate_projects => :environment do
    Project.all.each do |project|
      if project.fundings_deadline < Date.today
        if project.earned < project.goal
          project.update(state: :failed)
        else
          project.update(state: :succeeded)
        end
      end
    end
  end
end