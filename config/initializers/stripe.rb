Rails.configuration.stripe = {
    :publishable_key => 'pk_test_CFpeiEJP0sfqxmo1D4RQPHEu',
    :secret_key      => 'sk_test_TeofOjNUBj6eIzIkBaQvJIeP'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]