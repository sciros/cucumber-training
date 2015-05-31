class Login
  include PageObject

  page_url(BASE_URL + '/login')

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :name => 'commit')
end