class BasePage
  include PageObject

  link(:log_out, text: /Logout/)
end