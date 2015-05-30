require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

browser = Watir::Browser.new :firefox

this_file_location = File.dirname(__FILE__)
config_file_path = this_file_location + '/../../config.yml' #directly in project directory
config = YAML.load_file(config_file_path)

BASE_URL = config['testApplicationUrl']

# adding PageObject and PageFactory to Cucumber's World
World(PageObject::PageFactory)

Before do
  @browser = browser
end

at_exit do
  browser.quit
end