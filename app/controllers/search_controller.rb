class SearchController < ApplicationController

  def index
    @stores = BestbuyStores.stores(params[:zip])
  end

end
