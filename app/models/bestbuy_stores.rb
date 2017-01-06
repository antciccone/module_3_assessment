class BestbuyStores

  attr_reader :name, :city, :phone, :type
  def initialize(service)
    @name   = servie[:longName]
    @city   = servie[:city]
    @phone  = servie[:phone]
    @type   = servie[:storeType]
  end

  def self.stores(zip)
    BestbuyService.new.best_buy_stores(zip).map do |raw_info|
      BestbuyStores.new(raw_info)
    end
  end

end
