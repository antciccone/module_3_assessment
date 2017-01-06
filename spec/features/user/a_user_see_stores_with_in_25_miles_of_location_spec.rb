require 'rails_helper'

describe 'As a user' do
  context 'when i enter a zipcode' do
    scenario 'I can see stores within 25 miles' do

      visit '/'

      fill_in :zip, with: '80202'

      #expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Name")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Phone")
      expect(page).to have_content("Store Type")
    end
  end
end



# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
