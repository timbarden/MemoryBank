ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

if ENV['ENABLE_CODE_COVERAGE']
    require 'simplecov'
    SimpleCov.start 'rails'
end