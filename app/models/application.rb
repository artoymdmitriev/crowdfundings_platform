class Application < ApplicationRecord
  has_one :user

  validates :name, presence: true
  validates :surname, presence: true
  validates :pic_link, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
end
