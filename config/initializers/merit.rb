# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

Merit::Badge.create!(
    id: 1,
    name: 'commenter-1',
    description: 'commenter-1',
    custom_fields: {
        image: '/assets/badges/chat.png',
    }
)

Merit::Badge.create!(
    id: 2,
    name: 'commenter-2',
    description: 'commenter-2',
    custom_fields: {
        image: '/assets/badges/chat.png',
    }
)

Merit::Badge.create!(
    id: 3,
    name: 'investor-1',
    description: 'investor-1',
    custom_fields: {
        image: '/assets/badges/first-100.png',
    }
)

Merit::Badge.create!(
    id: 4,
    name: 'investor-2',
    description: 'investor-2',
    custom_fields: {
        image: '/assets/badges/first-100.png',
    }
)

Merit::Badge.create!(
    id: 5,
    name: 'investor-3',
    description: 'investor-3',
    custom_fields: {
        image: '/assets/badges/first-100.png',
    }
)

Merit::Badge.create!(
    id: 6,
    name: 'investor-4',
    description: 'investor-4',
    custom_fields: {
        image: '/assets/badges/first-100.png',
    }
)

Merit::Badge.create!(
    id: 7,
    name: 'investor-5',
    description: 'investor-5',
    custom_fields: {
        image: '/assets/badges/first-100.png',
    }
)

Merit::Badge.create!(
    id: 8,
    name: 'commenter-3',
    description: 'commenter-3',
    custom_fields: {
        image: '/assets/badges/chat.png',
    }
)

Merit::Badge.create!(
    id: 9,
    name: 'commenter-4',
    description: 'commenter-4',
    custom_fields: {
        image: '/assets/badges/chat.png',
    }
)

Merit::Badge.create!(
    id: 10,
    name: 'commenter-5',
    description: 'commenter-5',
    custom_fields: {
        image: '/assets/badges/chat.png',
    }
)
