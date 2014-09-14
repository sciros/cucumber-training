#TODO should maybe move the "include? text" in here now

class BasePage
  include PageObject

  link(:movies, :text => 'Movies')
end