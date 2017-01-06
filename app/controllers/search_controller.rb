class SearchController < ApplicationController

  def index
    @stores = BestbuyStores.stores(params[:zip])
    #need to add flash
  end

end
