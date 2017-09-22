class User < ApplicationRecord
  has_merit
  ratyrate_rater

  enum role: [:unchecked, :checked, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects
  has_many :comments
  has_many :payments
  has_one :application
  has_many :notifications
  has_many :news_items
  has_many :subscriptions

  def amount_of_projects
    self.projects.count
  end

  def application_confirmed?
    !self.application.nil? && self.application.is_confirmed?
  end
end
