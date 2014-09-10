require_relative 'base_page'

class Account < BasePage
  page_url($base_url+'/account')

  link(:logout, :text => /Logout/)
end