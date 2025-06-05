RSpec.configure do |config|
  # Use the expect syntax (recommended)
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Disable monkey patching (use only the new syntax)
  config.disable_monkey_patching!

  # Print the 10 slowest examples to help identify slow tests
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in case you want to reproduce failures
  Kernel.srand config.seed
end
