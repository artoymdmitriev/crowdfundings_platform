class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # TODO add translations
  validates :text, presence: true, length: { minimum: 4, message: 'is too short' }
  validates :user_id, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true


end
