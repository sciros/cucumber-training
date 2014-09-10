require_relative 'base_page'

class Payment < BasePage
  # rename from confirm_puchase_button to confirm_purhase_link
  link(:confirm_purchase_link, :text => 'Purchase Tix')

  text_field(:name, :id => 'name')
  text_field(:credit_card_number, :id => 'cc_number')
  select_list(:months, :id => 'date_month') # or select(...)
  select_list(:years, :id => 'date_year')

  text_field(:street_address, :id => 'street_address')
  text_field(:city, :id => 'city')
  text_field(:state, :id => 'state')
  text_field(:zip, :id => 'zip')

  # renamed from submit_info_button to complete_purchase_button
  button(:complete_purchase_button, :name => 'commit')

  def enter_payment_information
    self.confirm_purchase_link
    self.name = 'Justin Hawkins'
    self.credit_card_number = '1111222233334444'
    self.months = '10 - October'
    self.years = '2016'
    self.street_address = '5555 Glendon Court'
    self.city = 'Dublin'
    self.state = 'OH'
    self.zip = '43016'
    self.complete_purchase_button
  end
end