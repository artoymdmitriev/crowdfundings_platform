class User < ApplicationRecord
  enum role: [:unchecked, :checked, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :comments
  has_one :application

  def amount_of_projects
    self.projects.count
  end

  def confirmed?
    puts "hello"
    !self.application.nil? && self.application.is_confirmed?
  end
end
