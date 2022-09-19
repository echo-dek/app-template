require "spec_helper"
ENV["RAILS_ENV"] = "test"
require File.expand_path("../config/environment", __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.file_fixture_path = Rails.root.join("spec", "files")
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # config.filter_gems_from_backtrace("gem name")

  config.before(:all) do
    `rm -rf tmp/storage#{ENV["TEST_ENV_NUMBER"]}`
  end

  # Rails replaces the Queue Adapter in tests so jobs don't actually run - they are just tested to see if they would have run
  # Instead we disable the test adapter and let the inline adapter do the work
  config.before(:each) do
    (ActiveJob::Base.descendants << ActiveJob::Base).each(&:disable_test_adapter)
    ActiveJob::Base.queue_adapter = :inline
  end
end
