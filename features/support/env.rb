require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'active_support/core_ext/string/inflections' # or write own titleize function
require_relative '../pages/base_page'

# TODO this is not in the other snapshots yet... get it working and then merge it in...
browser_arguments = {detach: true}
chrome_options = {'args' => %w(disable-web-security start-maximized disable-infobars)}
capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => chrome_options)
browser_arguments[:desired_capabilities] = capabilities

browser = Watir::Browser.new :chrome, browser_arguments

this_file_location = File.dirname __FILE__
config_file_path = this_file_location + '/../../config/config.yml' #directly in project directory
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']
DATABASE_HOST = config['databaseHost']
username = 'user1' # could also move these into config.yml or generate if testing registration

# adding PageFactory to Cucumber's World
World(PageObject::PageFactory)

module CustomWorld
  def authenticated?
    authenticated = false
    if @current_page
      authenticated = @current_page.text.include? 'Welcome'
    else
      authenticated = on(BasePage).text.include? 'Welcome'
    end
    authenticated
  end
end

World(CustomWorld)

Before do
  @username = username
  @browser = browser
end

at_exit do
  browser.quit
end