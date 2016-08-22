# frozen_string_literal: true
require 'rack_health_check/version'
require 'rack_health_check/config'
require 'rack_health_check/strategy/http_checker'
require 'rack_health_check/strategy/redis_checker'
require 'rack_health_check/checker'

# Main gem module
module RackHealthCheck
  def self.configure
    yield config
  end

  def self.config
    @config ||= Config.new
  end

  def self.config=(config)
    @config = config
  end

  configure do |config|
    config.path = '/health_check'
    config.success = 'success'
    config.http_status_for_error = 500
    config.strategies = [
      RackHealthCheck::Strategy::HttpChecker
    ]
  end
end
