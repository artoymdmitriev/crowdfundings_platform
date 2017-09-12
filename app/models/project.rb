class Project < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments, :as => :commentable
  has_many :payments

  validates :name, presence: true
  validates :fundings_deadline, presence: true
  validates :description, presence: true
  validates :pic_link, presence: true
  validates :user_id, presence: true
  validates :goal, presence: true
end
