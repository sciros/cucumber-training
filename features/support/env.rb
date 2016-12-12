require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'active_support/core_ext/string/inflections' # or write own titleize function

this_file_location = File.dirname __FILE__
config_file_path = this_file_location + '/../../config/config.yml'
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']
DATABASE_HOST = config['databaseHost']
username = 'user1' # could also move these into config.yml or generate if testing registration

caps = {}
mobile_emulation = {}
special_size = false
if ENV['EMULATION']
  special_size = true
  mobile_emulation[:deviceName] = config[ENV['EMULATION']]
  caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { :mobileEmulation => mobile_emulation })
end
caps[:name] = 'Watir Webdriver'
browser = Watir::Browser.new(:chrome, desired_capabilities: caps)

if special_size
  browser.window.resize_to(config[ENV['SIZE']]['portrait']['width'], config[ENV['SIZE']]['portrait']['height'])
end

# adding PageFactory to Cucumber's World
World(PageObject::PageFactory)

Before do
  @username = username
  @browser = browser
  @config = config
end

at_exit do
  browser.quit
end
