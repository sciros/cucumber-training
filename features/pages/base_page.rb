class BasePage
  include PageObject

  link(:movies, :text => 'Movies')

  def includes_text(text)
    self.wait_until(5) do
      self.text.include? text
    end
  end
end