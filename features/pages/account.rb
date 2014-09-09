require_relative 'base_page'

class Account < BasePage
  link(:logout, :text => /Logout/)
end