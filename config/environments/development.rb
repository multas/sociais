Msociais::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  # E-mail
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "mail.multassociais.net",
    :port                 => 587,
    :domain               => "multassociais.net",
    :user_name            => "contato@multassociais.net",
    :password             => ENV['EMAIL_PASS'],
    :authentication       => :login,
    :enable_starttls_auto => false  }
  config.action_mailer.perform_deliveries = false # Mudar para true se quiser testar a entrega de emails em ambiente de desenvolvimento. Precisa setar variavel de ambiente EMAIL_PASS
  config.action_mailer.raise_delivery_errors = true
  
  # Preferences
  SEND_EMAIL_TO_ADMIN = false
  
end
