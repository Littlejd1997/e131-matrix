# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
ENV["SECRET_KEY_BASE"]= '2a67756c0d22087bbe17c4c0f3372081ecd903795f8f0a72dc6dd549e728cc2dcd09a2bbc6d18be28e85b6fc2eb60c395042f7fc5aafa4ca7a78ef8545324196'
run Rails.application
