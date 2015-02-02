class BasePage
  include PageObject

  def should_contain_text(text)
    self.wait_until(5) do
      self.text.include? text
    end
  end

  link(:logout, :text => /Logout/)
  link(:view_movies, :text => 'Movies')
  link(:view_account, :text => 'My Account')
end