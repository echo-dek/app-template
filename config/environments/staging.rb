require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.action_mailer.smtp_settings = { address: ENV["EMAIL_HOST"], port: ENV["EMAIL_PORT"], domain: ENV["EMAIL_DOMAIN"], user_name: ENV["EMAIL_USER"], password: ENV["EMAIL_PASSWORD"], authentication: "plain", enable_starttls_auto: true }
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { host: ENV["HOSTNAME"] }
  config.active_job.queue_adapter = :sidekiq
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.require_master_key = true
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.assets.compile = true
  config.asset_host = config.action_mailer.default_url_options[:host]
  Rails.application.routes.default_url_options[:host] = config.action_mailer.default_url_options[:host]
  config.active_storage.service = :orbit
  config.force_ssl = true
  config.ssl_options = { redirect: { exclude: ->(rq) { rq.path =~ /health_check/ } } }
  config.log_level = :info
  config.log_tags = []
  config.cache_store = :mem_cache_store, ENV["MEMCACHED_URL"]
  config.action_mailer.perform_caching = false
  # config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_support.disallowed_deprecation = :log
  config.active_support.disallowed_deprecation_warnings = []
  config.log_formatter = ::Logger::Formatter.new
  config.lograge.enabled = true
  config.lograge.custom_options = lambda do |event|
    event.payload
  end
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
end
