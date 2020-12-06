# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionCable.server.config.logger = Logger.new(nil)
