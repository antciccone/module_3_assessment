require 'rails_helper'


describe 'BestbuyService' do
  context 'returns an array of stores' do
    it '.best_buy_stores' do

      stores = BestbuyService.new

      expect(stores.best_buy_stores(80202).class).to eq(Array)
    end
  end
end
