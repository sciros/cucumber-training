class BasePage
  include PageObject

  link(:log_out, visible_text: /Logout/)
  link(:view_movies, visible_text: 'Movies')
  link(:view_theaters, visible_text: 'Theaters')

  def should_contain_text(text, error_message="Expected text '#{text}' never appeared")
    wait_until(5, error_message) do
      self.text.include? text
    end
  end
end