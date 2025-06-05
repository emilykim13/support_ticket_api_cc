ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Abort if the Rails environment is production to avoid data loss
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Include FactoryBot methods if you use it
  # config.include FactoryBot::Syntax::Methods

  # If you want to use fixtures, you can uncomment this:
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, you can skip this
  config.use_transactional_fixtures = false

  # Automatically infer spec types based on file location
  config.infer_spec_type_from_file_location!

  # Filter Rails gems from backtraces
  config.filter_rails_from_backtrace!

  # You can add custom config here
end
