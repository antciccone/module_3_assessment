class BestbuyService

  def initialize
    @conn ||= Faraday.new(url: "https://api.bestbuy.com") do |faraday|
            faraday.adapter  Faraday.default_adapter
    end
  end
  def best_buy_stores(zip)
    stores_json = conn.get do |req|
      req.url "stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['pageSize'] = 'longName,city,phone,storeType'
      req.params['show'] = '15'
      req.params['apiKey'] = "#{ENV['API_KEY']}"
    end
    require "pry"; binding.pry
  end

   private

    attr_reader :conn
end
