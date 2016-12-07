require_relative 'base_page'

class Login < BasePage
  page_url(BASE_URL + '/login')

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :name => 'commit')

  def initialize_page
    wait_until(5) {
      login?
    }
  end
end