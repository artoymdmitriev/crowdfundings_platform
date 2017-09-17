# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      grant_on 'comments#create', badge: 'commenter-1' do |comment|
        comment.user.comments.count == 1
      end

      grant_on 'comments#create', badge: 'commenter-2' do |comment|
        comment.user.comments.count == 15
      end

      grant_on 'comments#create', badge: 'commenter-3' do |comment|
        comment.user.comments.count == 50
      end

      grant_on 'comments#create', badge: 'commenter-4' do |comment|
        comment.user.comments.count == 100
      end

      grant_on 'comments#create', badge: 'commenter-5' do |comment|
        comment.user.comments.count == 500
      end

      grant_on 'payments#create', badge: 'investor-1' do |payment|
        payment.amount.to_i >= 10 && payment.amount.to_i < 20
      end

      grant_on 'payments#create', badge: 'investor-2' do |payment|
        payment.amount.to_i >= 20 && payment.amount.to_i < 50
      end

      grant_on 'payments#create', badge: 'investor-3' do |payment|
        payment.amount.to_i >= 50 && payment.amount.to_i < 100
      end

      grant_on 'payments#create', badge: 'investor-4' do |payment|
        payment.amount.to_i >= 100 && payment.amount.to_i < 1000
      end

      grant_on 'payments#create', badge: 'investor-5' do |payment|
        payment.amount.to_i >= 1000
      end

      grant_on 'news_items#create', badge: 'news-maker-1' do |news_item|
        news_item.user.news_items.count == 1
      end

      grant_on 'news_items#create', badge: 'news-maker-2' do |news_item|
        news_item.user.news_items.count == 10
      end

      grant_on 'news_items#create', badge: 'news-maker-3' do |news_item|
        news_item.user.news_items.count == 20
      end

      grant_on 'news_items#create', badge: 'news-maker-4' do |news_item|
        news_item.user.news_items.count == 50
      end

      grant_on 'news_items#create', badge: 'news-maker-5' do |news_item|
        news_item.user.news_items.count == 100
      end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
