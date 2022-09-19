require "active_support/core_ext/integer/time"
Rails.application.configure do
  config.hosts.clear
  config.action_mailer.default_url_options = { host: "test.example.com", port: 3000 }
  config.action_controller.default_url_options = config.action_mailer.default_url_options

  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local = true
  config.action_cable.disable_request_forgery_protection = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  config.active_storage.service = :test

  config.action_mailer.delivery_method = :test
  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load

  config.log_level = :info
  config.active_record.verbose_query_logs = true

  config.assets.debug = true
  config.assets.quiet = true
  config.sass.inline_source_maps = true

  config.active_job.queue_adapter = :inline

  config.i18n.raise_on_missing_translations = true
  config.action_view.annotate_rendered_view_with_filenames = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
