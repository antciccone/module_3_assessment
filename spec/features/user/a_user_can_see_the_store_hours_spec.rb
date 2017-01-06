require 'rails_helper'


describe 'As a user' do
  xcontext 'When I click on a store name' do
    it 'I should see the store name' do

      visit '/'

      fill_in :zip, with: '80202'
      click_button 'Search'

      click_link "Best Buy - Belmar"

      #expect(current_path).to eq(stores_path(id))
      expect(page).to have_content("City")
      expect(page).to have_content("State")
      expect(page).to have_content("zip")
    end
  end
end

# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
