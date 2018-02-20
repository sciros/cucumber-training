class BasePage
  include PageObject

  link(:log_out, :text => /Logout/)
  link(:view_movies, :text => 'Movies')
  link(:view_theaters, :text => 'Theaters')
end