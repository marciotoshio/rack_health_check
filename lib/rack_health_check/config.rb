# frozen_string_literal: true
module RackHealthCheck
  # Class to hold configuration values
  class Config
    attr_accessor :path
    attr_accessor :success
    attr_accessor :http_status_for_error
    attr_accessor :strategies
  end
end
