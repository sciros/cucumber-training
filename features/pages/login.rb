require_relative 'base_page'

class Login < BasePage
  direct_url(BASE_URL + '/login')

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:submit_credentials, name: 'commit')

  def initialize_page
    username_element.when_present 5
  end

  def log_in_with(username, password)
    self.username = username
    self.password = password
    submit_credentials
  end
end

