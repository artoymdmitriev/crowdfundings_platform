class Project < ApplicationRecord
  enum state: [:active, :failed, :succeeded]
  belongs_to :user, optional: true
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :payments
  has_many :news_items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 10, message: 'is too short' }
  validates_date :fundings_deadline, on_or_after: :today
  validates :description, presence: true, length: { minimum: 40, message: 'is too short' }
  validates :pic_link, presence: true
  validates :user_id, presence: true
  validates :goal, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :min_payment, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :max_payment, presence: true, numericality: { greater_than: :min_payment }
end
