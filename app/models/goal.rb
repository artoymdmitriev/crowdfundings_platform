class Goal < ApplicationRecord
  belongs_to :project, optional: true
end