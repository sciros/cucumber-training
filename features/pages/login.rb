class Login
  include PageObject

  direct_url(BASE_URL + '/login')

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:submit_credentials, name: 'commit')
end