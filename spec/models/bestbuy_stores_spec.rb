require 'rails_helper'

describe 'BestbuyStores' do
  context 'returns stores within 25 miles' do
    it '.stores' do

      stores = BestbuyStores.stores(80202)
      store = stores.first

      expect(stores.count).to eq(15)
      expect(store).to respond_to(:distance)
      expect(store).to respond_to(:name)
      expect(store).to respond_to(:phone)
      expect(store).to respond_to(:type)
      expect(store.distance).to eq(3.25)
      expect(store.city).to eq("Denver")
      expect(store.name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(store.phone).to eq("303-270-9189")
      expect(store.type).to eq("Mobile")
    end
  end
end
