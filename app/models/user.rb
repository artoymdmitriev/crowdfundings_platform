class User < ApplicationRecord
  enum role: [:unchecked, :checked, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_one :passport

  def amount_of_projects
    self.projects.count
  end
end
