# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password, :credit_card_number, :credit_card_expiration, :credit_card_cvv]
