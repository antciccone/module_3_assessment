require 'rails_helper'

describe 'BestbuyStores' do
  context 'returns stores within 25 miles' do
    it '.stores' do

      stores = BestbuyStores.stores(80202)
      store = stores.first
      
      expect(store).to respond_to(:city)
      expect(store).to respond_to(:phone)
      expect(store).to respond_to(:name)
    end
  end
end
