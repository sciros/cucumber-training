require 'titleize'

module StepHelper
  def get_page_class(page_name)
    page_name = convert_to_constant_name(page_name)
    Object.const_get(page_name)
  end

  def convert_to_constant_name(page_name)
    # make lowercase, capitalize words, remove spaces
    page_name.downcase.titleize.gsub(' ','')
  end
end

World(StepHelper)
