class BasePage
  include PageObject

  link(:logout, :text => /Logout/)
  link(:view_movies, :text => 'Movies')

  def should_contain_text(text)
    self.wait_until(5) do
      self.text.include? text
    end
  end
end