require_relative 'base_page'

class Account < BasePage
  direct_url(BASE_URL + '/account')

  def initialize_page
    should_contain_text 'This is your account'
  end
end