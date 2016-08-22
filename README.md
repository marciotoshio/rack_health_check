# rack_health_check gem

Simple health check of rack apps.

The basic goal is to quickly check that rack app is up and running and that it has access to correctly configured resources (database, redis, memcached, elasticsearch or whatever you want)

## Checks

- http

## Installation

Add the following line to Gemfile

`gem 'rack_health_check'`

And then execute

`bundle`

Or install it yourself as:

`gem install rack_health_check`

## Configuration

To change the configuration of health_check, create a file `config/initializers/rack_health_check.rb` and add a configuration block like:

    RackHealthCheck.config do |config|

      # Path for do the check
      config.path = '/health_check'

      # Text output upon success
      config.success = 'success'

      # Http status code when any exception occurs
      config.http_status_for_error = 500

      # Strategies that you want to check
      config.strategies = [
        RackHealthCheck::Strategy::Http
      ]
    end

## Uptime Monitoring

Use a website monitoring service to check the url regularly for the word "success" (without the quotes) rather than just a 200 http status so
that any substitution of a different server or generic information page should also be reported as an error.

If an error is encounted, the text "some error message/s" will be returned and the http status will be 500.

See

- Pingdom Website Monitoring - https://www.pingdom.com
- NewRelic Availability Monitoring - http://newrelic.com/docs/features/availability-monitoring-faq
- Uptime by OpenACS - http://uptime.openacs.org/uptime/
- Engine Yard's guide - https://support.cloud.engineyard.com/entries/20996821-monitor-application-uptime (although the guide is based on fitter_happier plugin it will also work with this gem)
- Nagios check_http (with -s success) - https://www.nagios-plugins.org/doc/man/check_http.html
- Any other montoring service that can be set to check for the word success in the text returned from a url

## Similar projects

- health_check

## Copyright

Copyright (c) 2016 Marcio Toshio Ide, released under the MIT license.
See MIT-LICENSE for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request (Code with specs are favoured)
