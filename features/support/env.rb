require 'watir'

browser = Watir::Browser.new :chrome

this_file_location = File.dirname __FILE__
config_file_path = this_file_location + '/../../config/config.yml' #directly in project directory
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']

Before do
  @browser = browser
end

at_exit do
  browser.quit
end