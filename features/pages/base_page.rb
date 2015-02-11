class BasePage
  include PageObject

  link(:logout, :text => /Logout/)
  link(:view_movies, :text => 'Movies')
  link(:view_theaters, :text => 'Theaters')
end