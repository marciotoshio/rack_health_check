# frozen_string_literal: true
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack_health_check/version'

Gem::Specification.new do |gem|
  gem.name          = 'rack_health_check'
  gem.version       = RackHealthCheck::VERSION
  gem.authors       = ['Marcio Toshio Ide']
  gem.email         = ['marcio@tosh.io']

  gem.summary = 'Simple health check of rack apps.'
  gem.description = <<-EOF
    Simple health check of rack apps for uptime monitoring.
  EOF
  gem.homepage      = 'https://github.com/marciotoshio/rack_health_check'

  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-nav'
end
