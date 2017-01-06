require 'rails_helper'


describe 'BestBuyService' do
  context 'returns an array of stores' do
    it '.best_buy_stores' do

      stores = BestBuyService.new

      expect(store.best_buy_stores(80202).class).to eq(Array)
    end
  end
end
