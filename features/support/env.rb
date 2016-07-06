require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

caps = {}
if ENV['EMULATION'] == 'IPHONE'
  mobile_emulation = {:deviceName => 'Apple iPhone 6'}
  caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { :mobileEmulation => mobile_emulation })
  caps[:name] = 'Watir Webdriver'
end
caps[:name] = 'Watir Webdriver'
browser = Watir::Browser.new(:chrome, desired_capabilities: caps)

this_file_location = File.dirname __FILE__
config_file_path = this_file_location + '/../../config.yml' #directly in project directory
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']
DATABASE_HOST = config['databaseHost']
USERNAME = 'user1' # could also move these into config.yml

# adding PageFactory to Cucumber's World
World(PageObject::PageFactory)

Before do
  @browser = browser
end

at_exit do
  browser.quit
end
