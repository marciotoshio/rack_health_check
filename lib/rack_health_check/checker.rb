# frozen_string_literal: true
module RackHealthCheck
  # Checker middleware
  class Checker
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == RackHealthCheck.config.path
        check
      else
        @app.call(env)
      end
    end

    private

    def check
      RackHealthCheck.config.strategies.each(&:health_check)
      [200, { 'Content-Type' => 'text/plain' },
       [RackHealthCheck.config.success]]
    rescue StandardError => e
      [RackHealthCheck.config.http_status_for_error,
       { 'Content-Type' => 'text/plain' },
       [e.message]]
    end
  end
end
