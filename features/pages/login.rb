require_relative 'base_page'

class Login < BasePage
  page_url(BASE_URL + '/login')

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, name: 'commit')

  def initialize_page
    login_element.when_present 5
  end

  def log_in_with(username, password)
    self.username = username
    self.password = password
    login
  end
end