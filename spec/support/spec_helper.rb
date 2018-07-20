require "saringan"
require "rspec/collection_matchers"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
