class Project < ApplicationRecord
  belongs_to :users, optional: true
end
