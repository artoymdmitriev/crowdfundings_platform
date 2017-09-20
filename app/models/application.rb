class Application < ApplicationRecord
  belongs_to :user
  mount_uploader :passport_image, PassportUploader

  validates :name, presence: true
  validates :surname, presence: true
  validates :passport_image, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
end
