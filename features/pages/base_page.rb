class BasePage
  include PageObject

  link(:log_out, visible_text: /Logout/)
  link(:view_movies, visible_text: 'Movies')
  link(:view_theaters, visible_text: 'Theaters')
end