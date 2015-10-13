require_relative 'base_page'

class ShowtimeInfo < BasePage
  link(:visit_login_page, :text => /Log in to buy/)

  def log_in
    visit_login_page
    on(Login).log_in_with(USERNAME,'P4ssw0rd')
  end
end