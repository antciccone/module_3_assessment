require 'rails_helper'

describe 'BestbuyStores' do
  context 'returns stores within 25 miles' do
    it '.stores' do

      store = BestbuyHours.hours(1118)

      expect(store).to respond_to(:hours)
      expect(store).to respond_to(:type)
      expect(store.type).to eq("BigBox")
      expect(store.hours).to eq("Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: Closed-closed; Sat: 10-9; Sun: Closed-closed")
    end
  end
end
