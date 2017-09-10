class Project < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments, :as => :commentable
end
