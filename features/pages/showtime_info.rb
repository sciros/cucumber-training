require_relative 'base_page'
require_relative 'login'

class ShowtimeInfo < BasePage
  link(:visit_login_page, visible_text: /Log in to buy/)
end