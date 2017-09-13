class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true, length: { minimum: 4, message: 'is too short' }
  validates :user_id, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true


end
