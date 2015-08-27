require_relative 'base_page'

class Payment < BasePage
  link(:start_payment_entry, :text => 'Purchase Tix')

  text_field(:name, :id => 'name')
  text_field(:credit_card_number, :id => 'cc_number')
  select_list(:month, :id => 'date_month') # or select(...)
  select_list(:year, :id => 'date_year')

  text_field(:street_address, :id => 'street_address')
  text_field(:city, :id => 'city')
  text_field(:state, :id => 'state')
  text_field(:zip, :id => 'zip')

  button(:complete_purchase, :name => 'commit')

  def enter_payment_information
    start_payment_entry
    self.name = 'Justin Hawkins'
    self.credit_card_number = '1111222233334444'
    self.month = 'October'
    self.year = '2016'
    self.street_address = '5555 Glendon Court'
    self.city = 'Dublin'
    self.state = 'OH'
    self.zip = '43016'
    complete_purchase
  end
end