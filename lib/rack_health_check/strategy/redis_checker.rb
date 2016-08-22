# frozen_string_literal: true
module RackHealthCheck
  module Strategy
    # Check status for https requests
    class RedisChecker
      def self.health_check
        response = Redis.new.ping
        raise "Redis error: #{response}" if response != 'PONG'
      end
    end
  end
end
