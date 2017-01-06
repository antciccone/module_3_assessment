require 'rails_helper'


describe 'BestbuyService' do
  context 'returns an array of stores' do
    it '.best_buy_stores' do

      stores = BestbuyService.new
      store = stores.best_buy_stores(80202).first

      expect(stores.best_buy_stores(80202).class).to eq(Array)
      expect(store).to have_key(:longName)
      expect(store).to have_key(:city)
      expect(store).to have_key(:phone)
      expect(store).to have_key(:storeType)
      expect(store[:city].class).to eq(String)
    end
  end
end
