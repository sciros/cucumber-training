class Login
  include PageObject

  page_url($base_url+'/login')

  text_field(:username, :id => 'login')
  text_field(:password, :id => 'password')
  button(:login, :name => 'commit')
end