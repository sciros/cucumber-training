class BasePage
  include PageObject

  def should_contain_text(text, error_message="Expected text '#{text}' never appeared")
    wait_until(5, error_message) do
      self.text.include? text
    end
  end

  link(:logout, :text => /Logout/)
  link(:view_movies, :text => 'Movies')
  link(:view_theaters, :text => 'Theaters')
  link(:view_account, :text => 'My Account')
end