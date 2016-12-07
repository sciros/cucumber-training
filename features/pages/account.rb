require_relative 'base_page'

class Account < BasePage
  def initialize_page
    self.wait_until(5, 'Account page did not load') do
      self.text.include? 'This is your account'
    end
  end
end