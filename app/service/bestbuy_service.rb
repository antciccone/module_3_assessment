class BestbuyService

  def initialize
    @conn ||= Faraday.new(url: "https://api.bestbuy.com") do |faraday|
            faraday.adapter  Faraday.default_adapter
    end
  end

  def best_buy_stores(zip)
    stores_json = conn.get do |req|
      req.url "v1/stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,phone,storeType,distance'
      req.params['pageSize'] = '15'
      req.params['apiKey'] = "#{ENV['API_KEY']}"
    end
    json_parse(stores_json.body)[:stores]
  end

  def best_buy_hours(id)
    store_json = conn.get do |req|
      req.url "v1/stores(storeId=#{id})"
      req.params['format'] = 'json'
      req.params['show'] = 'storeType,hours,hoursAmPm,gmtOffset,detailedHours'
      req.params['apiKey'] = "#{ENV['API_KEY']}"
    end
    a = json_parse(store_json.body)[:stores]
    require "pry"; binding.pry
  end

  def json_parse(stores)
    JSON.parse(stores, symbolize_names: true)
  end
   private

    attr_reader :conn
end
