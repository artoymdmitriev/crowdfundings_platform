class Application < ApplicationRecord
  has_one :user
  mount_uploader :passport_image, PassportUploader

  validates :name, presence: true
  validates :surname, presence: true
  #validates :pic_link, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
end
