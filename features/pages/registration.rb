#exercise
require_relative 'base_page'

class Registration < BasePage
  page_url(BASE_URL + '/user/create')

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:register, :name => 'commit')

  def register_with(username, password)
    self.username = username
    self.password = password
    register
  end
end