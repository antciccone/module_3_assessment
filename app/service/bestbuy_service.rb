class BestBuyService

  def initialize
    @conn ||= Faraday.new(url: "https://api.bestbuy.com") do |faraday|
            faraday.adapter  Faraday.default_adapter
    end
  end

  def best_buy_stores(zip)
    stores_json = conn.get do |req|
      req.url "stores(area(#{zip},25))"
  end

  def private

    attr_reader :conn
end
