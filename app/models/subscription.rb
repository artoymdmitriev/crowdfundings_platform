class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user, uniqueness: { scope: :project }
end
