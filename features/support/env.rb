require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'active_support/core_ext/string/inflections' # or write own titleize function

browser = Watir::Browser.new :chrome

this_file_location = File.dirname __FILE__
config_file_path = this_file_location + '/../../config/config.yml' #directly in project directory
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']
DATABASE_HOST = config['databaseHost']

# adding PageFactory to Cucumber's World
World(PageObject::PageFactory)

Before do
  @browser = browser
end

at_exit do
  browser.quit
end