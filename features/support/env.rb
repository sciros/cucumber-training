require 'watir'

# TODO this is not in the other snapshots yet... get it working and then merge it in...
browser_arguments = { detach:true }
chrome_options = { 'args' => %w(disable-web-security start-maximized disable-infobars) }
capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => chrome_options)
browser_arguments[:desired_capabilities] = capabilities

browser = Watir::Browser.new :chrome, browser_arguments

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