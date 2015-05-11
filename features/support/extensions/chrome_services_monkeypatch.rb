module Selenium
  module WebDriver
    module Chrome
      class Service
        def self.default_service(*extra_args)
          new executable_path, PortProber.above(DEFAULT_PORT + ENV['TEST_ENV_NUMBER'].to_i), *extra_args
        end
      end
    end
  end
end