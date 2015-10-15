require_relative 'base_page'
require_relative 'login'

class ShowtimeInfo < BasePage
  link(:visit_login_page, :text => /Log in to buy/)

  def log_in
    visit_login_page
    on(Login).log_in_with('user1','P4ssw0rd')
  end
end