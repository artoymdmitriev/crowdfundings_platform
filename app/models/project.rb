class Project < ApplicationRecord
  enum state: [:active, :failed, :succeeded]
  belongs_to :user, optional: true
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :payments
  has_many :news_items, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :subscriptions
  accepts_nested_attributes_for :goals,
                                allow_destroy: true,
                                reject_if: proc { |att| att['description'].blank? || att['amount'].blank? }
  acts_as_taggable_on :tags

  validates :name, presence: true, length: { minimum: 10, message: 'is too short' }
  #validates_date :fundings_deadline, on_or_after: :today
  validates :description, presence: true, length: { minimum: 40, message: 'is too short' }
  validates :pic_link, presence: true
  validates :user_id, presence: true
  validates :min_payment, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :max_payment, presence: true, numericality: { greater_than: :min_payment }

  # TODO refactor according to new goals system
  def self.check_state
    Project.all.each do |project|
      if project.fundings_deadline < Date.today
        bool = false
        project.goals.each { |goal| bool = true if goal.is_achieved }
        if bool
          project.update(state: :succeeded)
        else
          project.update(state: :failed)
        end
      end
    end
  end

  # TODO refactor
  def earned_money project
    earned = 0
    payments = project.payments.all
    payments.each { |p| earned += p.amount if p.project_id == project.id }
    earned
  end
end
